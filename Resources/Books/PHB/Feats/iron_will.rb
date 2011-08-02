class IronWill < FeatModel
	
	def initialize 
		super
		@title = "Iron Will"
		@description = "You have exceptional willpower."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.add(char)
		super(char)
		char.will_save["misc"] += 2
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end

FeatList.push(IronWill)