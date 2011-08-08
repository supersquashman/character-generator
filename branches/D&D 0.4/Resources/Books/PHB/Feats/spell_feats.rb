class EschewMaterials < FeatModel
	def initialize 
		super
		@title = "Eschew Materials"
		@bonus_classes = []
		@description = "You can cast any spell that has a material component costing 1 gp or less without needing that component. (The casting of the spell still provokes attacks of opportunity as normal.) If the spell requires a material component that costs more than 1 gp, you must have the material component at hand to cast the spell, just as normal."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#eschewMaterials"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

FeatList.push(EschewMaterials)