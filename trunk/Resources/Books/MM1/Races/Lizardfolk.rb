# Lizardfolk - Model of D&D race and container for related information
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

#--== Lizardfolk ============================================================================#
#++
class Lizardfolk < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("2d6+14")
		@favored_classes=["Druid"]
		character.languages.learn_lang("Common")
		character.languages.learn_lang("Draconic")
		@bonus_languages = ["Aquan", "Goblin", "Gnoll", "Orc"]
		@racial_HD = "2d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d10+70")
				character.weight = (120 +((character.height - 58) * Roll.new("2d4").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d10+67")
				character.weight = (85 +((character.height - 53) * Roll.new("2d4").to_i))#extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 1
			character.stats["str"] += 2
			character.stats["con"] += 2
			character.stats["int"] -= 2
			character.HD += 2
			character.HP += Roll.new(@racial_HD).to_i
			character.BAB += 1
			character.fort_save["racial"] = 0
			character.ref_save["racial"] = 3
			character.will_save["racial"] = 0
			character.ac_list["natural"] += 5
			character.weapon_proficiencies |= $SIMPLE_WEAPONS
			character.armor_proficiencies |= $SHIELDS
			num_skills = (character.stat_mod["int"] + 2) * 5
			character.skill_list.class_skills = ["Balance", "Jump", "Swim"]
			character.skill_list.assign_misc("Jump", 4)
			character.skill_list.assign_misc("Swim", 4)
			character.skill_list.assign_misc("Balance", 4)
			character.add_ability("Hold Breath")
			character.add_ability("Natural Weapon:  Claws (1d4)")
			character.add_ability("Natural Weapon:  Bite (1d4)")
		end
	end
end
RaceList.push(Lizardfolk)