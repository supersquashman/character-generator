#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class PowerAttack < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Power Attack"
		@description = "On your action, before making attack rolls for a round, you may choose to subtract a number from all melee attack rolls and add the same number to all melee damage rolls." +
    "This number may not exceed your base attack bonus. The penalty on attacks and bonus on damage apply until your next turn."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["str"] >= 13
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end
FeatList.push(PowerAttack)