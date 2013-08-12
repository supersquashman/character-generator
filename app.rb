
require 'sinatra'
require 'haml'
require 'mongo_mapper'
require 'bson'
require 'omniauth'
require 'omniauth-google-oauth2'
require 'omniauth-identity'
require 'rack-flash'
require 'nokogiri'
require_relative "#{File.dirname(__FILE__)}/lib/Character_Generator"
require_relative "#{File.dirname(__FILE__)}/lib/monster/monster"

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

MongoMapper.database = 'testapp'
set :server, %w[thin webrick]
set :env, :production
set :bind, '0.0.0.0'
set :port, 80
use Rack::Session::Cookie #TODO
use Rack::Flash
use OmniAuth::Builder do
  provider :google_oauth2, '822217719876.apps.googleusercontent.com', 'bqKm_dMVYLi1xYscmr_b9H1m'
  provider :identity, :fields => [:email, :name], :on_failed_registration => lambda { |env|
    env['rack.session'][:identity] = env['omniauth.identity']
    resp = Rack::Response.new
    resp.redirect('/sign_up')
    resp.finish
  }
end
Monster.load_sources
@@monsterlist=nil
@@pfmonsterlist=nil
@@racelist=nil
@@classlist=nil

class User
  include MongoMapper::Document

  key :email, String
  key :name, String
  key :nickname, String
  key :provider, String
  many :game_entitys
  many :encounters
  timestamps!
end

class Encounter
  include MongoMapper::Document
  
  key :name, String
  key :gameent_ids, Array
  key :encounter_id, String
  many :game_entitys, :in => :gameent_ids
  belongs_to :user
  timestamps!
end

class Identity
  include MongoMapper::Document
  include OmniAuth::Identity::Models::MongoMapper

  key :email, String, :unique => true
  key :name, String, :required => true
  key :password_digest, String
  
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i  
end

class GameEntity
  include MongoMapper::Document
  
  key :name, String
  key :tags, Array
  key :content, String
  key :entity_id, String
  key :notes, String
  key :private, Boolean
  
  timestamps!
  belongs_to :user
  
  def data
    Nokogiri::HTML(content).text.gsub("\n","\r\n") + "\r\nNotes:\r\n" + Nokogiri::HTML(notes).text.gsub("\n","\r\n")
  end
  
  def display(app, authenticated)
     app.haml :character, :locals => {:entity => self, :auth => authenticated}
  end
end

class CharacterEntity < GameEntity
  key :character, Character
  
  def data
    Nokogiri::HTML(content).text.gsub("\n","\r\n") + "\r\nNotes:\r\n" + Nokogiri::HTML(notes).text.gsub("\n","\r\n")
  end
  
  def display(app, authenticated)
    app.haml :character, :locals => {:entity => self, :auth => authenticated}
  end
end

post '/change' do
  @entity = GameEntity.where(:entity_id=>params[:pk] ).first
  if (!current_user.nil?) && @entity.user == current_user
    @entity.update_attributes({params[:name]=>params[:value]})
    if @entity.save
      status 200
    else
      status 400
      reply = "Error Saving"
    end
  else
    status 400
    reply="Not Authentiated"
  end
  reply
end

get '/create' do
  e = GameEntity.sort(:entity_id).inject([]) {|a,v| a.push(v.entity_id.to_i)}.sort{|a,b| b<=>a}
  entity_id = e.empty? ? 0 : e[0]+1
  number_of_characters = 1
  char_level = 2
  num_classes = 2
  generator = CharacterGenerator.new
  character = generator.generate( params )
  name = character.name
  content = character.string.gsub("\n", "<br>\n")
  @entity = CharacterEntity.new(:entity_id =>entity_id,:name=>name, :character=>character,
  :content=>content, :private =>false, :user=>current_user)
  @entity.save
  redirect "/character/#{@entity.entity_id}"
end

get '/add_monster' do
  redirect "/" unless current_user
  m = Monster.where(:monster_id=>params["id"]).first
  if m.nil?
    flash[:err] = "Monster not found"
    redirect "/"
  else
    e = GameEntity.sort(:entity_id).inject([]) {|a,v| a.push(v.entity_id.to_i)}.sort{|a,b| b<=>a}
    entity_id = e.empty? ? 0 : e[0]+1
    GameEntity.new(:entity_id =>entity_id,:name=>m.name,
      :content=>m.full_text, :private =>false, :user=>current_user).save
    redirect "/character/#{entity_id}"
  end
end

get '/monster/:id' do |id|
  m = Monster.where(:monster_id=>id).first
  if m.nil?
    flash[:err] = "Monster not found"
    redirect "/"
  end
    haml ".container-fluid
  -if current_user
    %a.btn{href: '/add_monster/#{m.monster_id}'}
  = m.full_text", :locals=>{:m=>m}
end
  
get '/character/:id' do |id|
  @entity = GameEntity.where(:entity_id=>id).first
  unless @entity.nil?
    if (@entity.private && @entity.user == current_user) || !@entity.private
      @entity.display(self,@entity.user == current_user && !@entity.user.nil?)
    else
      flash[:err] = "That entity is private"
      redirect "/"
    end
  else
    flash[:notice] = "Entity not found"
    redirect "/"
  end
end

get '/download/:id' do |id|
  @entity = GameEntity.where(:entity_id=>id).first
  content_type 'text/plain'
  attachment "#{@entity.name}.txt"
  @entity.data.to_s
end

post '/delete' do
  redirect "/" unless current_user
  if params[:delete]
    deletelist = []
    params[:delete].keys.each do |id|
      entity = GameEntity.where(:entity_id=>id).first
      name = entity.name
      if entity.user != current_user
        flash[:err] = "Entity - #{name} could not be deleted"
        redirect "/list/"
      end
      deletelist.push(name)
      flash[:ok] = "Entity(s) #{deletelist.join(", ")} Deleted"
      entity.destroy
    end
  end
  redirect "/list/"
end

get '/delete/:id' do |id|
  redirect "/" unless current_user
  @entity = GameEntity.where(:entity_id=>id).first
  name = @entity.name
  if @entity.user != current_user
    flash[:err] = "Entity - #{name} could not be deleted"
    redirect "/list/"
  end
  @entity.destroy
  flash[:ok] = "Entity - #{name} Deleted"
  redirect "/list/"
end

get "/list/?" do
  redirect "/" unless current_user
	haml :char_list
end

get "/encounters" do
  redirect "/" unless current_user
	haml :encounters
end

get "/encounter/[:id]/[:cid]" do
  redirect "/" unless current_user
	haml :encounter
end

get "/new_character/?" do
  haml :settings
end

get '/' do
	haml :index
end

get "/sign_up/?" do
  @identity = env['rack.session'][:identity]
  env['rack.session'][:identity] = nil
  haml :sign_up
end

%w(get post).each do |method|
  send(method, "/auth/:provider/callback") do
    auth = request.env['omniauth.auth']
    user = User.first({ :uid => auth["uid"], :provider => auth["provider"]})
    unless user
      user = User.create({:uid => auth["uid"],
      :provider => auth["provider"],
      :name => auth["info"]["name"], 
      :nickname => auth["info"]["nickname"], 
      :email => auth["info"]["email"]})
    end
    session[:user_id] = user.id
    flash[:ok] = "Logged In!"
    redirect '/'
  end
end

get '/auth/failure' do
  flash[:err] = params[:message]
  redirect '/'
end

["/sign_out/?", "/signout/?", "/log_out/?", "/logout/?"].each do |path|
  get path do
    session[:user_id] = nil
    flash[:notice] = "Logged Out."
    redirect '/'
  end
end