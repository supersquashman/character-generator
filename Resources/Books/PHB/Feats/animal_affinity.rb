#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class AnimalAffinity < FeatModel
	def initialize 
		super
		@title = "Animal Affinity"
		@tag = ""
		@description = "+2 Bonus to Handle Animal and Ride checks"
		@page = "PHB??"
		@link = ""
		@ftr = false
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Handle Animal",2)
		char.skill_list.assign_misc("Ride",2)
	end
end
FeatList.push(AnimalAffinity)