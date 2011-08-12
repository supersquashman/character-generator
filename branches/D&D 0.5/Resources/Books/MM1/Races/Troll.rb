# Troll - Model of D&D race and container for related information
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

#--== Troll ============================================================================#
#++
class Troll < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Large"
		@speed = 30
		@age_roll = Roll.new("10d10+25")
		@favored_classes=["Fighter"]
		character.languages.learn_lang("Giant")
		@bonus_languages = ["Common", "Orc"]
		@racial_HD = "6d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d12+96")
				character.weight = (character.height.to_i * 4.6).floor #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("3d12+100")
				character.weight = (character.height.to_i * 4.7).floor #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 5
			character.HD += 6
			character.BAB += 4
			character.HP += Roll.new(@racial_HD).to_i
			character.stats["str"] += 12
			character.stats["cha"] += 1
			character.stats["con"] += 12
			character.stats["dex"] += 4
			(character.stats["int"] - 4)>3? character.stats["int"] -= 4 : character.stats["int"] = 3
			character.fort_save["racial"] = 5
			character.ref_save["racial"] = 2
			character.will_save["racial"] = 2
			character.ac_list["natural"] += 5
			FeatList.roll_feats(character, 2)
			num_skills = (character.stat_mod["int"] + 2) * 9
			character.skill_list.class_skills = ["Listen","Spot"]
			character.skill_list.roll_skills(num_skills)
			character.add_ability("Low-Light Vision")
			character.add_ability("Darkvision(60ft.)")
			character.add_ability("Regeneration (5)")
			character.add_ability("Scent")
			character.add_ability("Special Attack: Rend - 2d6+(1.5*strength modifier)")
			character.add_ability("Natural Weapon:  Claw (1d6)")
			character.add_ability("Natural Weapon:  Bite (1d6)")
		end
	end
end
RaceList.push(Troll)