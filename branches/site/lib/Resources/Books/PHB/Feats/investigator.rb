#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class Investigator < FeatModel

	def initialize 
		super
		@title = "Investigator"
		@bonus_classes = []
		@description = "+2 Bonus on Gather Information and Search checks"
		@page = "PHB97"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Gather Information",2)
		char.skill_list.assign_misc("Search",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(Investigator,"PHB")