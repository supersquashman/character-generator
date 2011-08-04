#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class TwoWeaponFighting < FeatModel
	@@bonus_classes = ["Fighter", "Ranger(Melee)"]
	
	def initialize 
		super
		@title = "Two-Weapon Fighting"
		@description = "You can fight with a weapon in each hand. You can make one extra attack each round with the second weapon."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 15
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class TwoWeaponDefense < FeatModel
	@@bonus_classes = ["Fighter", "Ranger(Melee)"]
	
	def initialize 
		super
		@title = "Two-Weapon Defense"
		@description = "+1 Shield bonus when fighting with a double weapon or a weapon in each hand. (+2 when fighting defensively or using total defense.)"
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 15 && TwoWeaponFighting.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ImprovedTwoWeaponFighting < FeatModel
	@@bonus_classes = ["Fighter", "Ranger(Melee)"]
	
	def initialize 
		super
		@title = "Two-Weapon Fighting (Improved)"
		@description = "In addition to the standard single extra attack you get with an off-hand weapon, you get a second attack with it, albeit at a -5 penalty."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 17 && TwoWeaponFighting.feat_taken(char) && char.BAB >= 6
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class GreaterTwoWeaponFighting < FeatModel
	@@bonus_classes = ["Fighter", "Ranger(Melee)"]
	
	def initialize 
		super
		@title = "Two-Weapon Fighting (Greater)"
		@description = "You get a third attack with your off-hand weapon, albeit at a -10 penalty."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 19 && TwoWeaponFighting.feat_taken(char) && ImprovedTwoWeaponFighting.feat_taken(char) && char.BAB >= 11
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

FeatList.push(TwoWeaponDefense)
FeatList.push(TwoWeaponFighting)
FeatList.push(ImprovedTwoWeaponFighting)
FeatList.push(GreaterTwoWeaponFighting)