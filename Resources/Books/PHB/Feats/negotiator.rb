#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class Negotiator < FeatModel

	def initialize 
		super
		@title = "Negotiator"
		@bonus_classes = []
		@description = "+2 Bonus on Diplomacy and Sense Motive checks"
		@page = "PHB98"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Diplomacy",2)
		char.skill_list.assign_misc("Sense Motive",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(Negotiator)