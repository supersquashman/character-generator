require_relative "../Roll"
class RaceModel
	attr_accessor :size, :age_roll, :speed, :favored_classes, :bonus_languages, :character
	def initialize(character)
		@character =character
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("2d6+15")
		@favored_classes=[]
		@bonus_languages = []
	end	
	def self.apply(character)
		character.race= self.new(character)
	end
	def apply_level
		#routines that are made every level
		if character.get_level < 1
			character.speed = speed
			character.size = size
			age_roll.make_rolls
			character.age = weighted_age(age_roll.to_i)
			character.stat_mod["int"].times {character.languages.roll_lang(bonus_languages)}
		end
	end
	def to_s
		String name = self.class.to_s.dup
		name.gsub!(/::/, '/')
		name.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1 \2')
		name.gsub!(/([a-z\d])([A-Z])/,'\1 \2')
		name.tr!("-", "_")
		return name
	end
end