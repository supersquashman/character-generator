
require_relative "#{File.dirname(__FILE__)}/Resources/Character"
Dir.glob(File.join("#{File.dirname(__FILE__)}", "/Resources/Lists", "*.rb")).each do |file|
   require file
end
Dir.glob(File.join("#{File.dirname(__FILE__)}", "/Resources/Models", "*.rb")).each do |file|
   require file
end
require_relative "#{File.dirname(__FILE__)}/Resources/Backgrounds/Background"
require_relative "#{File.dirname(__FILE__)}/Resources/Names/Name"

sources = ["PHB","MM1"]
RaceList.sources(sources)
ClassList.sources(sources)
FeatList.sources(sources)
sources.each { |book| Dir.glob("#{File.dirname(__FILE__)}/*Resources/*Books/"+book+"/*Races/*.rb").each {|file| require file} }
sources.each { |book| Dir.glob("#{File.dirname(__FILE__)}/*Resources/*Books/"+book+"/*Classes/*.rb").each {|file| require file} }
sources.each { |book| Dir.glob("#{File.dirname(__FILE__)}/*Resources/*Books/"+book+"/*Feats/*.rb").each {|file| require file} }
sources.each { |book| Dir.glob("#{File.dirname(__FILE__)}/*Resources/*Books/"+book+"/*Items/*.rb").each {|file| require file} }

class CharacterGenerator
	@@character_list = []
  
  def generate(args={})
    args = {} unless args.is_a?(Hash)
    level = args["level"] ? args["level"].to_i : (rand(20) + 1)
    multiclass = args["multiclass"] ? args["multiclass"].to_i : (rand(5) + 1)
    multiclass = 1 if args["class"].is_a?(String)
    races = args["race"].is_a?(Hash) ? args["race"].keys : RaceList.list
    races = args["race"].is_a?(String) ? [args["race"]] : RaceList.list
    classes = args["class"].is_a?(Hash) ? args["class"].keys : ClassList.list
    classes = args["class"].is_a?(String) ? [args["class"]] : ClassList.list
    feats = args["feat"].is_a?(Hash) ? args["feat"].keys : FeatList.list
    seed = !args["seed"].nil? ? args["seed"].to_i : 0
    upto = !args["upto"].nil? ? true : false
    
    generate_specific_level_character(level, multiclass, races, classes, feats, seed, upto)
  
  end
	
  def generate_specific_level_character(char_level = 1, num_classes = 1, race_restriction = RaceList.list, class_restriction = ClassList.list, feat_restriction = FeatList.list, seed = 0, upto = false)
		seed = (seed == 0) ? Random.new_seed : seed
		srand(seed)
    char_level = rand(char_level)+1 if upto
    
		char = Character.new(race_restriction, class_restriction, feat_restriction, seed)
		char.max_classes = num_classes
		char_level.times do
			char.level_up
		end
		char.final_levelup
		return char
	end
end