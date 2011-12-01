#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class Diligent < FeatModel

	def initialize 
		super
		@title = "Diligent"
		@bonus_classes = []
		@description = "+2 Bonus on Appraise and Decipher Script checks"
		@page = "PHB93"
		@link = ""
	end
	def self.add(char)
		super(char)
		char.skill_list.assign_misc("Appraise",2)
		char.skill_list.assign_misc("Decipher Script",2)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end
FeatList.push(Diligent)