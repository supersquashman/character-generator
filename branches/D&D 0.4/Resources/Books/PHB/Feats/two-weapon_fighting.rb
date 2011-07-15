#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class TwoWeaponFighting < FeatModel
	@@bonus_classes = ["Fighter", "Ranger(Melee)"]
	
	def initialize 
		super
		@title = "Two-Weapon Fighting"
		@description = "Reduce penalty for fighting with two weapons"
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !char.feats.include?(self) && char.stats["dex"] >= 15
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end
FeatList.push(TwoWeaponFighting)