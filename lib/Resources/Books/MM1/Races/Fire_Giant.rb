# Fire Giant - Model of D&D race and container for related information
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

#--== Fire Giant ============================================================================#
#++
class FireGiant < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Large"
		@speed = 40
		@age_roll = Roll.new("10d10+75")
		@favored_classes=["Cleric"]
		character.languages.learn_lang("Giant")
		@bonus_languages = ["Common", "Draconic", "Elven", "Goblin", "Orc"]
		@racial_HD = "15d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("3d12+126")
				character.weight = (character.height.to_i * 48.07) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("3d12+120")
				character.weight = (character.height.to_i * 48.06) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 4
			character.HD += 15
			character.BAB += 11
			character.HP += Roll.new(@racial_HD).to_i
			character.stats["str"] += 20
			character.stats["cha"] += 4
			character.stats["con"] += 10
			character.stats["dex"] -= 1
			character.fort_save["racial"] = 9
			character.ref_save["racial"] = 5
			character.will_save["racial"] = 7
			character.ac_list["natural"] += 8
			FeatList.roll_feats(character, 5)
			num_skills = (character.stat_mod["int"] + 2) * 15
			character.skill_list.class_skills = ["Climb","Jump","Intimidate","Spot"]
			character.skill_list.roll_skills(num_skills)
			#Craft (any one) +6
			character.add_ability("Low-Light Vision")
			character.add_ability("Immunity to Fire")
			character.add_ability("Rock Catching")
			character.add_ability("Vulnerability to Cold")
			character.weapon_proficiencies |= ["Greatsword"]
		end
	end
end
RaceList.push(FireGiant,"MM1")