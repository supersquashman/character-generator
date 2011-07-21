#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class DeftHands < FeatModel

	def initialize 
		super
		@title = "Deft Hands"
		@bonus_classes = []
		@description = "+2 Bonus on Sleight of Hand and Use Rope checks"
		@page = "PHB93"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Sleight of Hand",2)
		char.skill_list.assign_misc("Use Rope",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(DeftHands)