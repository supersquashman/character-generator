class EmpowerSpell < FeatModel
	def initialize 
		super
		@title = "Empower Spell"
		@bonus_classes = ["Wizard"]
		@description = "All variable, numeric effects of an empowered spell are increased by one-half.

Saving throws and opposed rolls are not affected, nor are spells without random variables. An empowered spell uses up a spell slot two levels higher than the spell’s actual level."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#empowerSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 2
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class EnlargeSpell < FeatModel
	def initialize 
		super
		@title = "Enlarge Spell"
		@bonus_classes = ["Wizard"]
		@description = "You can alter a spell with a range of close, medium, or long to increase its range by 100%. An enlarged spell with a range of close now has a range of 50 ft. + 5 ft./level, while medium-range spells have a range of 200 ft. + 20 ft./level and long-range spells have a range of 800 ft. + 80 ft./level. An enlarged spell uses up a spell slot one level higher than the spell’s actual level.

Spells whose ranges are not defined by distance, as well as spells whose ranges are not close, medium, or long, do not have increased ranges."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#enlargeSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class ExtendSpell < FeatModel
	def initialize 
		super
		@title = "Extend Spell"
		@bonus_classes = ["Wizard"]
		@description = "An extended spell lasts twice as long as normal. A spell with a duration of concentration, instantaneous, or permanent is not affected by this feat. An extended spell uses up a spell slot one level higher than the spell’s actual level."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#extendSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class HeightenSpell < FeatModel
	def initialize 
		super
		@title = "Heighten Spell"
		@bonus_classes = ["Wizard"]
		@description = "A heightened spell has a higher spell level than normal (up to a maximum of 9th level). Unlike other metamagic feats, Heighten Spell actually increases the effective level of the spell that it modifies. All effects dependent on spell level (such as saving throw DCs and ability to penetrate a lesser globe of invulnerability) are calculated according to the heightened level. The heightened spell is as difficult to prepare and cast as a spell of its effective level."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#heightenSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class MaximizeSpell < FeatModel
	def initialize 
		super
		@title = "Maximize Spell"
		@bonus_classes = ["Wizard"]
		@description = "All variable, numeric effects of a spell modified by this feat are maximized. Saving throws and opposed rolls are not affected, nor are spells without random variables. A maximized spell uses up a spell slot three levels higher than the spell’s actual level.

An empowered, maximized spell gains the separate benefits of each feat: the maximum result plus one-half the normally rolled result."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#maximizeSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 4
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class QuickenSpell < FeatModel
	def initialize 
		super
		@title = "Quicken Spell"
		@bonus_classes = ["Wizard"]
		@description = "Casting a quickened spell is an swift action. You can perform another action, even casting another spell, in the same round as you cast a quickened spell. You may cast only one quickened spell per round. A spell whose casting time is more than 1 full round action cannot be quickened. A quickened spell uses up a spell slot four levels higher than the spell’s actual level. Casting a quickened spell doesn’t provoke an attack of opportunity."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#quickenSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 6
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class SilentSpell < FeatModel
	def initialize 
		super
		@title = "Silent Spell"
		@bonus_classes = ["Wizard"]
		@description = "A silent spell can be cast with no verbal components. Spells without verbal components are not affected. A silent spell uses up a spell slot one level higher than the spell’s actual level."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#silentSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class StillSpell < FeatModel
	def initialize 
		super
		@title = "Still Spell"
		@bonus_classes = ["Wizard"]
		@description = "A stilled spell can be cast with no somatic components.

Spells without somatic components are not affected. A stilled spell uses up a spell slot one level higher than the spell’s actual level."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#stillSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class WidenSpell < FeatModel
	def initialize 
		super
		@title = "Widen Spell"
		@bonus_classes = ["Wizard"]
		@description = "You can alter a burst, emanation, line, or spread shaped spell to increase its area. Any numeric measurements of the spell’s area increase by 100%.A widened spell uses up a spell slot three levels higher than the spell’s actual level.

Spells that do not have an area of one of these four sorts are not affected by this feat."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#widenSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 4
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

FeatList.push(WidenSpell)
FeatList.push(StillSpell)
FeatList.push(SilentSpell)
FeatList.push(QuickenSpell)
FeatList.push(MaximizeSpell)
FeatList.push(HeightenSpell)
FeatList.push(ExtendSpell)
FeatList.push(EnlargeSpell)
FeatList.push(EmpowerSpell)