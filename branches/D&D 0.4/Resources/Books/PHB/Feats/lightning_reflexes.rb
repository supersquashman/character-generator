class LightningReflexes < FeatModel
	
	def initialize 
		super
		@title = "Lightning Reflexes"
		@description = "You have exceptional reflexes."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.add(char)
		super(char)
		char.ref_save["misc"] += 2
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

FeatList.push(LightningReflexes)