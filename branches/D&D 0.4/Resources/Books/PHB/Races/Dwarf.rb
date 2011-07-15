# Dwarf - Model of D&D skills and container for related information
# Copyright (C) 2011  Cody Garrett, Josh Murphy, and Matt Ingram

# This file is part of FishTornado D&D Character Generator.

# FishTornado D&D Character Generator is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# FishTornado D&D Character Generator is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with FishTornado D&D Character Generator.  If not, see <http://www.gnu.org/licenses/>.

#require 'pathname' 
#require Pathname(__FILE__).ascend{|d| h=d+'RaceModel.rb'; break h if h.file?} 

#--== Dwarf ============================================================================#
#++
class Dwarf< RaceModel
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 20
		@age_roll = Roll.new("7d6+40")
		@favored_classes=["Fighter"]
		character.languages.learn_lang("Dwarven")
		@bonus_languages = ["Giant", "Gnome", "Goblin", "Orc", "Terran", "Undercommon"]
	end
	def apply_level
		super
		if(character.level <= 1)
			character.stats["con"] += 2
			character.stats["cha"] -= 2                     
			character.skill_list.assign_circ("Appraise","Racial (Stone)", 2)
			character.skill_list.assign_circ("Craft","Racial (Stone)", 2)
			character.skill_list.assign_circ("Search","Stonecunning", 2)
			character.add_ability("Darkvision(60)")
			character.add_ability("Weapon Familiarity (Dwarven Waraxe)") 
			character.add_ability("Weapon Familiartiy (Urgrosh)")
			character.add_ability("+4 Ability vs Bull Rush or Trip [Ground]")
			character.add_ability("+2 Saves vs Poision")
			character.add_ability("+2 Saves vs Spells")
			character.add_ability("+1 attack vs orcs and goblins")
			character.add_ability("+4 Dodge(Giant)")
		end
	end
end
RaceList.push(Dwarf)