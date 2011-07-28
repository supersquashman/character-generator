class WhirlwindAttack < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Whirlwind Attack"
		@description = "When you use the full attack action, you can give up your regular attacks and instead make one melee attack at your full base attack bonus "+
						"against each opponent within reach.

			When you use the Whirlwind Attack feat, you also forfeit any bonus or extra attacks granted by other feats, spells, or abilities."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["int"] >= 13 && char.stats["dex"] >= 13 && Dodge.feat_taken(char) && Mobility.feat_taken(char) && char.BAB >= 4 && CombatExpertise.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end

FeatList.push(WhirlwindAttack)