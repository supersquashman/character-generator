require 'prawn'
require "#{File.dirname(__FILE__)}/../../../../D&D 0.5/Character_Generator.rb"

class DndCharactersController < ApplicationController
  # GET /dnd_characters
  # GET /dnd_characters.xml
  def index
    @dnd_characters = DndCharacter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dnd_characters }
    end
  end

  # GET /dnd_characters/1
  # GET /dnd_characters/1.xml
  def show
    @dnd_character = DndCharacter.find(params[:id])
    generator = CharacterGenerator.new
    @character = generator.generate_specific_level_character(1, 1, sources = ["PHB","MM"], seed = @dnd_character.seed) 

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dnd_character }
      format.txt  { send_data OutputFormat.string(@character), :filename => "#{@character.name}.txt"}
    end
  end

  # GET /dnd_characters/new
  # GET /dnd_characters/new.xml
  def new
    @dnd_character = DndCharacter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dnd_character }
    end
  end

  # GET /dnd_characters/1/edit
  def edit
    @dnd_character = DndCharacter.find(params[:id])
  end

  # POST /dnd_characters
  # POST /dnd_characters.xml
  def create
    
    generator = CharacterGenerator.new
    @character = generator.generate_specific_level_character(1, 1, sources = ["PHB","MM"], seed = params[:dnd_character][:seed].to_i)
    params[:dnd_character][:name] =@character.name.to_s
    @dnd_character = DndCharacter.new(params[:dnd_character])
    puts params

    respond_to do |format|
      if @dnd_character.save
        format.html { redirect_to(@dnd_character, :notice => 'Dnd character was successfully created.') }
        format.xml  { render :xml => @dnd_character, :status => :created, :location => @dnd_character }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dnd_character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dnd_characters/1
  # PUT /dnd_characters/1.xml
  def update
    @dnd_character = DndCharacter.find(params[:id])

    respond_to do |format|
      if @dnd_character.update_attributes(params[:dnd_character])
        format.html { redirect_to(@dnd_character, :notice => 'Dnd character was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dnd_character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dnd_characters/1
  # DELETE /dnd_characters/1.xml
  def destroy
    @dnd_character = DndCharacter.find(params[:id])
    @dnd_character.destroy

    respond_to do |format|
      format.html { redirect_to(dnd_characters_url) }
      format.xml  { head :ok }
    end
  end
end
