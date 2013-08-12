#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class NimbleFingers < FeatModel

	def initialize 
		super
		@title = "Nimble Fingers"
		@bonus_classes = []
		@description = "+2 Bonus on Disable Device and Open Lock checks"
		@page = "PHB98"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Disable Device",2)
		char.skill_list.assign_misc("Open Lock",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(NimbleFingers,"PHB")