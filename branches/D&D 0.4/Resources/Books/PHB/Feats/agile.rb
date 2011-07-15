#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class Agile < FeatModel
	def initialize 
		super
		@title = "Agile"
		@tag = ""
		@description = "+2 Bonus to Balance and Escape Artist checks"
		@page = "PHB??"
		@link = ""
		@ftr = false
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Balance",2)
		char.skill_list.assign_misc("Escape Artist",2)
	end
end
FeatList.push(Agile)