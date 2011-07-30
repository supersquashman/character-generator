class LightArmorProficiency < FeatModel
	
	def initialize 
		super
		@title = "Armor Proficiency (Light)"
		@description = "When you wear armor with which you are proficient, armor check penalty only applies to Balance, Climb, Escape Artist, Hide, Jump, Move Silently, Pick Pocket, and Tumble checks."
		@page = "PHB 89"
		@link = ""
	end
	
	def self.add(char)
		super(char)
		char.armor_proficiencies |= $ARMOR_LIGHT
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class MediumArmorProficiency < FeatModel
	
	def initialize 
		super
		@title = "Armor Proficiency (Medium)"
		@description = "When you wear armor with which you are proficient, armor check penalty only applies to Balance, Climb, Escape Artist, Hide, Jump, Move Silently, Pick Pocket, and Tumble checks."
		@page = "PHB 89"
		@link = ""
	end
	
	def self.add(char)
		super(char)
		char.armor_proficiencies |= $ARMOR_MEDIUM
	end
	
	def self.available?(char)
		return !feat_taken(char) && LightArmorProficiency.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class HeavyArmorProficiency < FeatModel
	
	def initialize 
		super
		@title = "Armor Proficiency (Heavy)"
		@description = "When you wear armor with which you are proficient, armor check penalty only applies to Balance, Climb, Escape Artist, Hide, Jump, Move Silently, Pick Pocket, and Tumble checks."
		@page = "PHB 89"
		@link = ""
	end
	
	def self.add(char)
		super(char)
		char.armor_proficiencies |= $ARMOR_HEAVY
	end
	
	def self.available?(char)
		return !feat_taken(char) && MediumArmorProficiency.feat_taken(char) && LightArmorProficiency.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

#FeatList.push(LightArmorProficiency)
#FeatList.push(MediumArmorProficiency)
#FeatList.push(HeavyArmorProficiency)