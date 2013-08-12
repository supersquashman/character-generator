#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class Alertness < FeatModel

	def initialize 
		super
		@title = "Alertness"
		@bonus_classes = []
		@description = "+2 Bonus to Listen and Spot checks"
		@page = "PHB??"
		@link = ""
	end
	
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Spot",2)
		char.skill_list.assign_misc("Listen",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(Alertness,"PHB")