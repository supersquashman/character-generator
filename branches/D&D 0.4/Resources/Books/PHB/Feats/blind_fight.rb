class BlindFight < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Blind Fight"
		@description = "In melee, every time you miss because of concealment, you can reroll your miss chance percentile roll one time to see if you actually hit.\n\n" +
						"An invisible attacker gets no advantages related to hitting you in melee. That is, you don't lose your Dexterity bonus to Armor Class, and the " +
						"attacker doesn't get the usual +2 bonus for being invisible. The invisible attacker's bonuses do still apply for ranged attacks, however\n\n." +
						"You take only half the usual penalty to speed for being unable to see. Darkness and poor visibility in general reduces your speed to " +
						"three-quarters normal, instead of one-half."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end

FeatList.push(BlindFight)