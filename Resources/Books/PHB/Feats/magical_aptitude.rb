#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class MagicalAptitude < FeatModel

	def initialize 
		super
		@title = "Magical Aptitude"
		@bonus_classes = []
		@description = "+2 Bonus on Spellcraft and Use Magic Device checks"
		@page = "PHB97"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Spellcraft",2)
		char.skill_list.assign_misc("Use Magic Device",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(MagicalAptitude)