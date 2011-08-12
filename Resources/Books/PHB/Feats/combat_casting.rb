class CombatCasting < FeatModel
	
	def initialize 
		super
		@title = "Combat Casting"
		@description = "You get a +4 bonus on Concentration checks made to cast a spell or use a spell-like ability while on the defensive or while you are grappling or pinned."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

FeatList.push(CombatCasting)