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

class ShieldProficiency < FeatModel
	def initialize 
		super
		@title = "Shield Proficiency"
		@description = "You can use a shield and take only the standard penalties."
		@page = "PHB 100"
		@link = ""
	end
	
	def self.add(char)
		super(char)
		char.armor_proficiencies |= $SHIELDS
	end
	
	def self.available?(char)
		return !(char.armor_proficiencies & $SHIELDS == $SHIELDS)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class TowerShieldProficiency < FeatModel
	def initialize 
		super
		@title = "Tower Shield Proficiency"
		@description = "You can use a tower shield and suffer only the standard penalties."
		@page = "PHB 101"
		@link = ""
	end
	
	def self.add(char)
		super(char)
		char.armor_proficiencies |= ["Tower Shield"]
	end
	
	def self.available?(char)
		return !(char.armor_proficiencies & $SHIELDS == $SHIELDS) && !char.armor_proficiencies.include?("Tower Shield")
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

FeatList.push(LightArmorProficiency,"PHB")
FeatList.push(MediumArmorProficiency,"PHB")
FeatList.push(HeavyArmorProficiency,"PHB")
FeatList.push(ShieldProficiency,"PHB")
FeatList.push(TowerShieldProficiency,"PHB")