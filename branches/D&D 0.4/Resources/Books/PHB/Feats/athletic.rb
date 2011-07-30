#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class Athletic < FeatModel

	def initialize 
		super
		@title = "Athletic"
		@bonus_classes = []
		@description = "+2 Bonus on Climb and Swim checks"
		@page = "PHB 89"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Climb",2)
		char.skill_list.assign_misc("Swim",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(Athletic)