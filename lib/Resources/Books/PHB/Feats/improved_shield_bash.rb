class ImprovedShieldBash < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Improved Shield Bash"
		@description = "When you perform a shield bash, you may still apply the shield's shield bonus to your AC."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#improvedShieldBash"
	end
	
	def self.available?(char)
		return !feat_taken(char) && (char.armor_proficiencies & ($SHIELDS | ["Tower Shield"]) ).size > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end
FeatList.push(ImprovedShieldBash,"PHB")