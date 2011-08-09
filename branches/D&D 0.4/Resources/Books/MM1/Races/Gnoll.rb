# Gnoll - Model of D&D race and container for related information
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

#--== Gnoll ============================================================================#
#++
class Gnoll< RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("2d4+14")
		@favored_classes=["Ranger"]
		character.languages.learn_lang("Gnoll")
		@bonus_languages = ["Common", "Draconic", "Elven", "Goblin", "Orc"]
    @racial_HD = "2d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d10+66")
				character.weight = (200 +((character.height - 66) * Roll.new("2d4").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d10+64")
				character.weight = (160 +((character.height - 64) * Roll.new("2d4").to_i))#extra weight is determined by multiplying the weight multiplier by the extra height
			end
      character.BAB += 1
			character.ECL += 1
      character.HD += 2
      character.HP += Roll.new(@racial_HD).to_i
      character.fort_save["racial"] = 3
      (character.stats["int"] - 2)>3? character.stats["int"] -= 2 : character.stats["int"] = 3
			character.stats["cha"] -= 2
      character.stats["str"] += 4
			character.stats["con"] += 2
      character.ac_list["natural"] += 1
      character.add_ability("Darkvision(60ft.)")
      FeatList.roll_feats(character, 1)
      character.skill_list.class_skills = ["Listen","Spot"]
      num_skills = (character.stat_mod["int"] + 2) * 5
      character.skill_list.roll_skills(num_skills)
		end
	end
end
RaceList.push(Gnoll)