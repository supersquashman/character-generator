#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class Stealthy < FeatModel

	def initialize 
		super
		@title = "Stealthy"
		@bonus_classes = []
		@description = "+2 Bonus on Hide and Move Silently checks"
		@page = "PHB100"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Hide",2)
		char.skill_list.assign_misc("Move Silently",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(Stealthy,"PHB")