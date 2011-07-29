# Hill Giant - Model of D&D race and container for related information
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

#--== Hill Giant ============================================================================#
#++
class HillGiant < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Large"
		@speed = 40
		@age_roll = Roll.new("8d10+20")
		@favored_classes=["Barbarian"]
		character.languages.learn_lang("Giant")
		@bonus_languages = ["Common", "Draconic", "Elven", "Goblin", "Orc"]
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			character.height = Roll.new("2d12+114")
			character.weight = (character.height.to_i * 9)
			character.ECL += 4
			character.HD += 12
			character.HP += Roll.new("12d8").to_i
			character.BAB += 8
			#character.feats
			character.stats["str"] += 14
			character.stats["cha"] -= 4
			character.stats["con"] += 8
			character.stats["dex"] -= 2
			character.stats["int"] -= 4
			character.fort_save["racial"] = 8
			character.ref_save["racial"] = 4
			character.will_save["racial"] = 4
			character.ac_list["natural"] = 9
			FeatList.roll_feats(character, 4)
			character.add_ability("Low-Light Vision")
			character.add_ability("Rock Catching")
			character.weapon_proficiencies |= $MARTIAL_WEAPONS | $SIMPLE_WEAPONS
			num_skills = (character.stat_mod["int"] + 2) * 15
			character.skill_list.class_skills = ["Climb","Jump","Listen","Spot"]
			character.skill_list.roll_skills(num_skills)
		end
	end
end
RaceList.push(HillGiant)