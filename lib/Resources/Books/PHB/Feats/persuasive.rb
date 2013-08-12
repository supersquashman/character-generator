#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class Persuasive < FeatModel

	def initialize 
		super
		@title = "Persuasive"
		@bonus_classes = []
		@description = "+2 Bonus on Bluff and Intimidate checks"
		@page = "PHB98"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Bluff",2)
		char.skill_list.assign_misc("Intimidate",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(Persuasive,"PHB")