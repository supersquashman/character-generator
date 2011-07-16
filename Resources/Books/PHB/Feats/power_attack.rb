#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class PowerAttack < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Power Attack"
		@description = "You make a power attack"
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