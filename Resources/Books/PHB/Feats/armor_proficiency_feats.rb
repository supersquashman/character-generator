require_relative File.join("#{File.dirname(__FILE__)}", "/../Items/Equipment")
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
		char.armor_proficiencies |= $LIGHT_ARMOR
	end
	
	def self.available?(char)
		return !((char.armor_proficiencies & $LIGHT_ARMOR) == $LIGHT_ARMOR)
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
		char.armor_proficiencies |= $MEDIUM_ARMOR
	end
	
	def self.available?(char)
		return !(char.armor_proficiencies & $MEDIUM_ARMOR == $MEDIUM_ARMOR) && (char.armor_proficiencies & $LIGHT_ARMOR == $LIGHT_ARMOR) 
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
		char.armor_proficiencies |= $HEAVY_ARMOR
	end
	
	def self.available?(char)
		return !(char.armor_proficiencies & $HEAVY_ARMOR == $HEAVY_ARMOR) && (char.armor_proficiencies & $MEDIUM_ARMOR == $MEDIUM_ARMOR) && (char.armor_proficiencies & $LIGHT_ARMOR == $LIGHT_ARMOR) 
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

FeatList.push(LightArmorProficiency)
FeatList.push(MediumArmorProficiency)
FeatList.push(HeavyArmorProficiency)