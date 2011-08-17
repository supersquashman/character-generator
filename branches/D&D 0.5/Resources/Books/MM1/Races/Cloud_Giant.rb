# Cloud Giant - Model of D&D race and container for related information
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

#--== Cloud Giant ============================================================================#
#++
class CloudGiant < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Huge"
		@speed = 50
		@age_roll = Roll.new("10d10+75")
		@favored_classes=["Cleric", "Sorcerer"]
		character.languages.learn_lang("Giant")
		@bonus_languages = ["Common", "Draconic", "Elven", "Goblin", "Orc"]
		@racial_HD = "17d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("4d12+192")
				character.weight = (character.height.to_i * 23.148) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("4d12+190")
				character.weight = (character.height.to_i * 23.138) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 6
			character.HD += 17
			character.BAB += 12
			character.HP += Roll.new(@racial_HD).to_i
			character.stats["str"] += 24
			character.stats["cha"] += 2
			character.stats["con"] += 12
			character.stats["dex"] += 3
			character.stats["int"] += 2
			character.stats["wis"] += 6
			character.fort_save["racial"] = 16
			character.ref_save["racial"] = 6
			character.will_save["racial"] = 10
			character.ac_list["natural"] += 12
			FeatList.roll_feats(character, 5)
			num_skills = (character.stat_mod["int"] + 2) * 15
			character.skill_list.class_skills = ["Climb","Jump","Intimidate","Spot", "Sense Motive", "Diplomacy"]
			character.skill_list.roll_skills(num_skills)
			#Craft (any one) +6
			character.add_ability("Low-Light Vision")
			character.add_ability("Oversized Weapon")
			character.add_ability("Rock Catching")
			character.add_ability("Scent")
			character.add_ability("Levitate (3/day)")
			character.add_ability("Obscuring Mist (3/day)")
			character.add_ability("Fog Clout (1/day)")
			character.weapon_proficiencies |= ["Morningstar"]
		end
	end
end
RaceList.push(CloudGiant)