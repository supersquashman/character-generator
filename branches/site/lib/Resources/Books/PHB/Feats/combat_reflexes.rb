class CombatReflexes < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Combat Reflexes"
		@description = "You may make a number of additional attacks of opportunity equal to your Dexterity bonus.  You may also make attacks of oppurtunity while flat-footed"
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end
FeatList.push(CombatReflexes,"PHB")