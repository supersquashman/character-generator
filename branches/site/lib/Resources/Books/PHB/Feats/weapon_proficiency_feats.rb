require_relative File.join("#{File.dirname(__FILE__)}", "/../Items/Equipment")
class SimpleWeaponProficiency < FeatModel
	
	def initialize 
		super
		@title = "Weapon Proficiency (Simple)"
		@description = "You make attack rolls with simple weapons normally."
		@page = "PHB 100"
		@link = ""
	end
	
	def self.add(char)
		super(char)
		char.weapon_proficiencies |= $SIMPLE_WEAPONS
	end
	
	def self.available?(char)
		return !((char.weapon_proficiencies & $SIMPLE_WEAPONS) == $SIMPLE_WEAPONS)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class MartialWeaponProficiency < FeatModel
attr_accessor :type

	def initialize 
		super
		@description = "You make attack rolls with the selected weapon normally."
		@page = "PHB 97"
		@link = ""
	end
	
	def self.add(char)
		super(char)
    choices = $MARTIAL_WEAPONS - char.weapon_proficiencies 
    prof = char.feats.last
    prof.type = choices[rand(choices.length)]
    prof.title = "Weapon Proficiency (" + prof.type.to_s + ")"
		char.weapon_proficiencies |= [prof.type]
	end
	
	def self.available?(char)
		return !(char.weapon_proficiencies & $MARTIAL_WEAPONS == $MARTIAL_WEAPONS)
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

class ExoticWeaponProficiency < FeatModel
attr_accessor :type
	
	def initialize 
		super
		@description = "Choose a type of exotic weapon. You understand how to use that type of exotic weapon in combat."
		@page = "PHB 94"
		@link = ""
	end
	
	def self.add(char)
		super(char)
    choices = $EXOTIC_WEAPONS - char.weapon_proficiencies 
    choices -= ["Bastard Sword", "Dwarven Waraxe"] if char.stats["str"] < 13
    prof = char.feats.last
    prof.type = choices[rand(choices.length)]
    prof.title = "Weapon Proficiency (" + prof.type.to_s + ")"
		char.weapon_proficiencies |= [prof.type]
	end
	
	def self.available?(char)
		return !(char.weapon_proficiencies & $EXOTIC_WEAPONS == $EXOTIC_WEAPONS) && char.BAB  > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return false
	end
end

FeatList.push(SimpleWeaponProficiency,"PHB")
FeatList.push(MartialWeaponProficiency,"PHB")
FeatList.push(ExoticWeaponProficiency,"PHB")