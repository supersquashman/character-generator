#require "RaceList"
#require Pathname(__FILE__).ascend{|d| h=d+'RaceList.rb'; break h if h.file?} 
class Human < RaceModel
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("2d6+15")
		@favored_classes=ClassList.list.collect {|val| val.to_s} #All classes
		@bonus_languages = [] #All languages
	end
	def apply_level
		super
		if character.get_level <1
			character.skill_list.roll_skills(4,[],0)
			#character.feats.roll_feats(1)
		else
			character.skill_list.roll_skills(1,[],character.classes.length)
		end
	end
end
RaceList.push(Human)