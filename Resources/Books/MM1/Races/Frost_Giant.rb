# Frost Giant - Model of D&D race and container for related information
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

#--== Frost Giant ============================================================================#
#++
class FrostGiant < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Large"
		@speed = 40
		@age_roll = Roll.new("10d10+25")
		@favored_classes=["Cleric"]
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
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d6+53")
				character.weight = (80 +((character.height - 53) * Roll.new("1d6").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 4
			character.HD += 14
			character.HP += Roll.new("14d8").to_i
			character.feats
			character.stats["str"] += 18
			character.stats["cha"] += 1
			character.stats["con"] += 11
			character.stats["dex"] -= 1
			character.fort_save["racial"] = 14
			character.ref_save["racial"] = 3
			character.will_save["racial"] = 6
			character.ac_list["natural"] = 9
			FeatList.list["PowerAttack"].add(character)
			character.skill_list.assign_circ("Climb", "Racial (Frost Giant)", 13)
			character.skill_list.assign_circ("Intimidate", "Racial (Frost Giant)", 6)
			character.skill_list.assign_circ("Jump", "Racial (Frost Giant)", 17)
			character.skill_list.assign_circ("Spot", "Racial (Frost Giant)", 12)
			#Craft (any one) +6
			character.add_ability("Low-Light Vision")
			character.add_ability("Immunity to Cold")
			character.add_ability("Rock Catching")
			character.add_ability("Vulnerability to Fire")
			character.weapon_proficiencies |= []
		end
	end
end
RaceList.push(FrostGiant)