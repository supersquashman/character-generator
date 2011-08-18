# Troglodyte - Model of D&D race and container for related information
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

#--== Troglodyte ============================================================================#
#++
class Troglodyte < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("2d6+14")
		@favored_classes=["Cleric"]
		character.languages.learn_lang("Draconic")
		@bonus_languages = ["Common", "Goblin", "Giant", "Orc"]
		@racial_HD = "2d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("1d12+55")
				character.weight = (character.height.to_i * 2.5) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("1d12+55")
				character.weight = (character.height.to_i * 2.5) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 2
			character.stats["dex"] -= 2
			character.stats["con"] += 4
			character.stats["int"] -= 2
			character.HD += 2
			character.HP += Roll.new(@racial_HD).to_i
			character.BAB += 1
			character.fort_save["racial"] = 3
			character.ref_save["racial"] = 0
			character.will_save["racial"] = 0
			character.ac_list["natural"] += 6
			num_skills = (character.stat_mod["int"] + 2) * 5
			character.skill_list.class_skills = ["Hide", "Listen"]
			character.skill_list.assign_misc("Hide", 4)
			character.skill_list.assign_circ("Hide", "(rocky or underground surroundings)",4)
			character.add_ability("Darkvision(90ft.)")
			character.add_ability("Stench (DC 13)")
			character.add_ability("Natural Weapon:  Claws (1d4)")
			character.add_ability("Natural Weapon:  Bite (1d4)")
			#FeatList.list["Multiattack"].add(character)
		end
	end
end
RaceList.push(Troglodyte)