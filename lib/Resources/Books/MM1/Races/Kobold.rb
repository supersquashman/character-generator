# Kobold - Model of D&D race and container for related information
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

#--== Kobold ============================================================================#
#++
class Kobold< RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Small"
		@speed = 30
		@age_roll = Roll.new("2d4+6")
		@favored_classes=["Sorcerer"]
		character.languages.learn_lang("Draconic")
		@bonus_languages = ["Common", "Undercommon"]
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d4+25")
				character.weight = (40 +((character.height - 25) * 1)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d4+22")
				character.weight = (30 +((character.height - 22) * 1)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.stats["dex"] += 2
			character.stats["con"] -= 2                     
			character.stats["str"] -= 4
			character.skill_list.assign_misc("Craft(Trapmaking)", 2)
			character.skill_list.assign_misc("Profession(Miner)", 2)
			character.skill_list.assign_misc("Search", 2)
			character.add_ability("Light Sensitivity")
			character.add_ability("Darkvision(60ft.)")
=begin
			character.add_ability("Natural Weapon:  Claw (1d3)")
			character.add_ability("Natural Weapon:  Bite (1d3)+1/2 str")
=end
			character.CR -= 3
			character.ac_list["natural"] += 1
=begin
			character.weapon_proficiencies |= ["Heavy Pick", "Light Pick"]
			character.final_levelup_procs += [%{Proc.new do |char|
				if (character.weapon_proficiencies & $MARTIAL_WEAPONS) == $MARTIAL_WEAPONS
					character.weapon_proficiencies |= ["Greatpick"]
					end
				end}]
=end
		end
	end
end
RaceList.push(Kobold,"MM1")