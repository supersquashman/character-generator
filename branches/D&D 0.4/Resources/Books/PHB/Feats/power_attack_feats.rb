#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class PowerAttack < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Power Attack"
		@description = "On your action, before making attack rolls for a round, you may choose to subtract a number from all melee attack rolls and add the same number to all melee damage rolls." +
    "This number may not exceed your base attack bonus. The penalty on attacks and bonus on damage apply until your next turn."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["str"] >= 13
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end

class Cleave < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Cleave"
		@description = "If you deal a creature enough damage to make it drop (typically by dropping it to below 0 hit points or killing it), you get an immediate, 
						extra melee attack against another creature within reach. You cannot take a 5-foot step before making this extra attack. The extra attack is 
						with the same weapon and at the same bonus as the attack that dropped the previous creature. You can use this ability once per round."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["str"] >= 13 && PowerAttack.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end

class GreatCleave < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Great Cleave"
		@description = "This feat works like Cleave, except that there is no limit to the number of times you can use it per round."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["str"] >= 13 && PowerAttack.feat_taken(char) && Cleave.feat_taken(char) && char.BAB >= 4
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end

class ImprovedBullRush < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Improved Bull Rush"
		@description = "When you perform a bull rush you do not provoke an attack of opportunity from the defender. You also gain a +4 bonus on the opposed 
						Strength check you make to push back the defender."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["str"] >= 13 && PowerAttack.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end

class ImprovedOverrun < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Improved Overrun"
		@description = "When you attempt to overrun an opponent, the target may not choose to avoid you. You also gain a +4 bonus on your Strength "+
						"check to knock down your opponent."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["str"] >= 13 && PowerAttack.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end

class ImprovedSunder < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Improved Sunder"
		@description = "When you strike at an object held or carried by an opponent (such as a weapon or shield), you do not provoke an attack of opportunity.

						You also gain a +4 bonus on any attack roll made to attack an object held or carried by another character."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["str"] >= 13 && PowerAttack.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end


FeatList.push(PowerAttack)
FeatList.push(Cleave)
FeatList.push(GreatCleave)
FeatList.push(ImprovedBullRush)
FeatList.push(ImprovedOverrun)
FeatList.push(ImprovedSunder)