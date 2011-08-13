# Drow - Model of D&D race and container for related information
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

#--== Drow ============================================================================#
#++
class Drow< RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("10d6+110")
		@favored_classes=["Wizard"]
		character.languages.learn_lang("Elven")
		character.languages.learn_lang("Undercommon")
		@bonus_languages = ["Abyssal", "Aquan", "Draconic", "Drow Sign Language", "Gnome", "Goblin"]
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d6+53")
				character.weight = (85 +((character.height - 53) * Roll.new("1d6").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
				@favored_class = ["Wizard"]
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d6+53")
				character.weight = (80 +((character.height - 53) * Roll.new("1d6").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
				@favored_class = ["Cleric"]
			end
			character.ECL += 2
			character.stats["int"] += 2
			character.stats["cha"] += 2     
			character.stats["dex"] += 2
			character.stats["con"] -= 2       
			character.skill_list.assign_circ("Listen", "Racial (Drow)", 2)
			character.skill_list.assign_circ("Spot", "Racial (Drow)", 2)
			character.skill_list.assign_circ("Search", "Racial (Drow)", 2)
			character.add_ability("Darkvision(120ft.)")
			character.weapon_proficiencies |= ["Hand Crossbow", "Rapier", "Short Sword"]
			character.add_ability("Immune to magic sleep effects")
			character.add_ability("+2 Will Saves vs Spells/Spell-like-abilities")
			character.add_ability("+2 Saves vs Enchantment Spells/Effects")
			character.add_ability("Spell-like ability:  Darkness (1/day)")
			character.add_ability("Spell-like ability:  Dancing Lights (1/day)")
			character.add_ability("Spell-like ability:  Faerie Fire (1/day)")
			character.add_ability("Light Blindness")
		end
		character.spell_resist = character.level + 11
	end
end
RaceList.push(Drow)