# Doppleganger - Model of D&D race and container for related information
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

#--== Doppleganger ============================================================================#
#++
class Doppleganger < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("4d10+25")
		@favored_classes=["Rogue"]
		character.languages.learn_lang("Common")
		@bonus_languages = ["Auran", "Dwarven", "Elven", "Gnome", "Halfling", "Giant", "Terran"]
		@racial_HD = "4d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d12+108")
				character.weight = (character.height.to_i * 5.48) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d12+108")
				character.weight = (character.height.to_i * 5.48) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 4
			character.HD += 4
			character.BAB += 4
			character.HP += Roll.new(@racial_HD).to_i
			character.stats["str"] += 2
			character.stats["dex"] += 2
			character.stats["con"] += 2
			character.stats["int"] += 2
			character.stats["wis"] += 4
			character.stats["cha"] += 2
			character.fort_save["racial"] = 1
			character.ref_save["racial"] = 4
			character.will_save["racial"] = 4
			character.ac_list["natural"] += 4
			character.skill_list.assign_misc("Bluff", 4)
			character.skill_list.assign_misc("Disguise", 4)
			character.skill_list.assign_circ("Disguise", "(Shape Changed)", 10)
			character.skill_list.assign_circ("Disguise", "(Reading Thoughts)", 4)
			FeatList.roll_feats(character, 1)
			num_skills = (character.stat_mod["int"] + 2) * 7
			character.skill_list.class_skills = ["Bluff", "Diplomacy", "Disguise", "Intimidate", "Listen", "Sense Motive", "Spot"]
			character.skill_list.roll_skills(num_skills)
			character.add_ability("Darkvision(60ft.)")
			character.add_ability("Change Shape")
			character.add_ability("Detect Thoughts")
			character.add_ability("Immunity to Sleep Effects")
			character.add_ability("Immunity to Charm Effects")
		end
	end
end
RaceList.push(Doppleganger,"MM1")