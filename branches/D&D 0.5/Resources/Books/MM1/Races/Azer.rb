# Ogre Mage - Model of D&D race and container for related information
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

#--== Ogre Mage ============================================================================#
#++
class OgreMage < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("7d6+60")
		@favored_classes=["Fighter"]
		character.languages.learn_lang("Common")
		character.languages.learn_lang("Ignan")
		@bonus_languages = ["Abyssal", "Aquan", "Auran", "Celestial", "Infernal", "Terran"]
		@racial_HD = "2d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d4+45")
				character.weight = (130 +((character.height - 45) * Roll.new("2d6").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d4+43")
				character.weight = (100 +((character.height - 43) * Roll.new("2d6").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 4
			character.HD += 2
			character.BAB += 2
			character.HP += Roll.new(@racial_HD).to_i
			character.stats["str"] += 2
			character.stats["cha"] -= 2
			character.stats["con"] += 2
			character.stats["int"] += 2
			character.stats["wis"] += 2
			character.stats["dex"] += 2
			character.fort_save["racial"] = 3
			character.ref_save["racial"] = 3
			character.will_save["racial"] = 3
			character.ac_list["natural"] += 6
			num_skills = (character.stat_mod["int"] + 8) * 5
			character.skill_list.class_skills = ["Appraise", "Listen", "Search", "Hide", "Spot"]
			#craft skill?
			character.skill_list.roll_skills(num_skills)
			character.add_ability("Darkvision(60ft.)")
			character.add_ability("Heat")
			character.add_ability("Immunity to Fire")
			character.add_ability("Vulnerability to Cold")
		end
		character.spell_resist = character.level + 13
	end
end
RaceList.push(OgreMage)