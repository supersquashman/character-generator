#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class Acrobatic < FeatModel

	def initialize 
		super
		@title = "Acrobatic"
		@bonus_classes = []
		@description = "+2 Bonus to Jump and Tumble checks"
		@page = "PHB??"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Jump",2)
		char.skill_list.assign_misc("Tumble",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(Acrobatic)