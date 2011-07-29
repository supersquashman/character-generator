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
		@age_roll = Roll.new("8d10+25")
		@favored_classes=["Barbarian"]
		character.languages.learn_lang("Giant")
		@bonus_languages = ["Common", "Draconic", "Elven", "Goblin", "Orc"]
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
			character.HD += 12
			character.HP += Roll.new("12d8").to_i
			character.feats
			character.stats["str"] += 14
			character.stats["cha"] -= 4
			character.stats["con"] += 8
			character.stats["dex"] -= 2
			character.stats["int"] -= 4
			character.fort_save["racial"] = 8
			character.ref_save["racial"] = 4
			character.will_save["racial"] = 4
			character.ac_list["natural"] = 9
			#FeatList.list["PowerAttack"].add(character)
			#FeatList.list["Cleave"].add(character)
			#FeatList.list["GreatCleave"].add(character)
			#FeatList.list["ImprovedOverrun"].add(character)
			#FeatList.list["ImprovedSunder"].add(character)
			FeatList.roll_feats(character, 5)
			character.skill_list.assign_misc("Climb", 13)
			character.skill_list.assign_misc("Intimidate", 6)
			character.skill_list.assign_misc("Jump", 17)
			character.skill_list.assign_misc("Spot", 12)
			#Craft (any one) +6
			character.add_ability("Low-Light Vision")
			character.add_ability("Rock Catching")
			character.weapon_proficiencies |= []
		end
	end
end
RaceList.push(HillGiant)