class EschewMaterials < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Eschew Materials"
		@description = "You can cast any spell that has a material component costing 1 gp or less without needing that component. (The casting of the spell still provokes attacks of opportunity as normal.) If the spell requires a material component that costs more than 1 gp, you must have the material component at hand to cast the spell, just as normal."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#eschewMaterials"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class SpellFocus < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Spell Focus"
		@description = "Add +1 to the Difficulty Class for all saving throws against spells from the school of magic you select."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#spellFocus"
	end
	
	def self.available?(char)
    schools = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Spell Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = ["Abjuration","Conjuration","Divination","Enchantment","Evocation","Illusion","Necromancy","Transmutation"]
    types -= schools - char.forbidden_spell_types
		return types.size > 0 && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  def self.add(char)
		super(char)
    schools = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Spell Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = ["Abjuration","Conjuration","Divination","Enchantment","Evocation","Illusion","Necromancy","Transmutation"]
    types -= schools - char.forbidden_spell_types
    type = types[rand(types.length)]
    char.feats.last.title = "Spell Focus(" + type + ")"
	end
end

class GreaterSpellFocus < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Greater Spell Focus"
		@description = "Add +1 to the Difficulty Class for all saving throws against spells from the school of magic you select. This bonus stacks with the bonus from Spell Focus."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#greaterSpellFocus"
	end
	
	def self.available?(char)
    schools = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Spell Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    gschools = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Greater Spell Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
		return (schools - gschools).size > 0 && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    schools = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Spell Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    gschools = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Greater Spell Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = schools - gschools
    type = types[rand(types.length)]
    char.feats.last.title = "Greater Spell Focus(" + type + ")"
	end
end

class AugmentSummoning < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Augment Summoning"
		@description = "Each creature you conjure with any summon spell gains a +4 enhancement bonus to Strength and Constitution for the duration of the spell that summoned it."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#augmentSummoning"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 0 && char.feats.include?("Spell Focus(Conjuration)")
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class NaturalSpell < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Natural Spell"
		@description = "You can complete the verbal and somatic components of spells while in a wild shape. You substitute various noises and gestures for the normal verbal and somatic components of a spell.

You can also use any material components or focuses you possess, even if such items are melded within your current form. This feat does not permit the use of magic items while you are in a form that could not ordinarily use them, and you do not gain the ability to speak while in a wild shape."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#naturalSpell"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["wis"] >= 13 && char.abilities.select{|i| i.include?("Wild Shape")}.size > 0 && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ImprovedCounterspell < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Improved Counterspell"
		@description = "When counterspelling, you may use a spell of the same school that is one or more spell levels higher than the target spell."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#improvedCounterspell"
	end
	
	def self.available?(char)
		return char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class SpellMastery < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Spell Mastery"
		@description = "Each time you take this feat, choose a number of spells equal to your Intelligence modifier that you already know. From that point on, you can prepare these spells without referring to a spellbook."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#spellMasterySpecial"
	end
	
	def self.available?(char)
    wizard_level = char.classes.reject {|val| val.class != Wizard}.size+1
		return wizard_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class SpellPenetration < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Spell Penetration"
		@description = "You get a +2 bonus on caster level checks (1d20 + caster level) made to overcome a creature's spell resistance."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#spellPenetration"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class GreaterSpellPenetration < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Greater Spell Penetration"
		@description = "You get a +2 bonus on caster level checks (1d20 + caster level) made to overcome a creature's spell resistance. This bonus stacks with the one from Spell Penetration."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#greaterSpellPenetration"
	end
	
	def self.available?(char)
		return SpellPenetration.feat_taken(char) && char.caster_level > 0 && !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

FeatList.push(EschewMaterials)
FeatList.push(SpellFocus)
FeatList.push(GreaterSpellFocus)
FeatList.push(AugmentSummoning)
FeatList.push(SpellPenetration)
FeatList.push(GreaterSpellPenetration)
FeatList.push(NaturalSpell)
FeatList.push(SpellMastery)
FeatList.push(ImprovedCounterspell)