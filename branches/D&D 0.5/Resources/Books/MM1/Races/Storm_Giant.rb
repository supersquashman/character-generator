# Storm Giant - Model of D&D race and container for related information
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

#--== Storm Giant ============================================================================#
#++
class StormGiant < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Huge"
		@speed = 50
		@age_roll = Roll.new("17d10+100")
		@favored_classes=["Cleric", "Sorcerer"]
		character.languages.learn_lang("Giant")
		@bonus_languages = ["Common", "Draconic", "Elven", "Goblin", "Orc"]
		@racial_HD = "19d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("5d12+216")
				character.weight = (character.height.to_i * 47.619) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("5d12+210")
				character.weight = (character.height.to_i * 47.619) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 8
			character.HD += 19
			character.BAB += 14
			character.HP += Roll.new(@racial_HD).to_i
			character.stats["str"] += 28
			character.stats["cha"] += 5
			character.stats["con"] += 12
			character.stats["dex"] += 4
			character.stats["int"] += 6
			character.stats["wis"] += 10
			character.fort_save["racial"] = 17
			character.ref_save["racial"] = 8
			character.will_save["racial"] = 13
			character.ac_list["natural"] += 12
			FeatList.roll_feats(character, 6)
			num_skills = (character.stat_mod["int"] + 2) * 15
			character.skill_list.class_skills = ["Climb", "Concentration", "Jump", "Intimidate", "Listen", "Spot", "Sense Motive", "Diplomacy"]
			character.skill_list.roll_skills(num_skills)
			character.skill_list.assign_misc("Swim", 8)
			#Craft (any one) +6
			character.add_ability("Low-Light Vision")
			character.add_ability("Freedom of Movement")
			character.add_ability("Immunity to Electricity")
			character.add_ability("Rock Catching")
			character.add_ability("Water Breathing")
			character.add_ability("Levitate (2/day)")
			character.add_ability("Control Weather (2/day)")
			character.add_ability("Call Lightning (1/day)")
			character.add_ability("Chain Lightning (1/day)")
			character.weapon_proficiencies |= ["Greatsword"]
		end
	end
end
RaceList.push(StormGiant)