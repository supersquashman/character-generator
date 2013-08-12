#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class SelfSufficient < FeatModel

	def initialize 
		super
		@title = "Self-Sufficient"
		@bonus_classes = []
		@description = "+2 Bonus on Heal and Survival checks"
		@page = "PHB100"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Heal",2)
		char.skill_list.assign_misc("Survival",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(SelfSufficient,"PHB")