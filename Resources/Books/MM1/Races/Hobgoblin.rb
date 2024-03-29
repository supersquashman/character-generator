# Hobgoblin - Model of D&D race and container for related information
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

#--== Hobgoblin ============================================================================#
#++
class Hobgoblin < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("2d6+14")
		@favored_classes=["Fighter"]
		character.languages.learn_lang("Common")
		character.languages.learn_lang("Goblin")
		@bonus_languages = ["Draconic", "Dwarven", "Infernal", "Giant", "Orc"]
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d12+58")
				character.weight = (150 +((character.height - 58) * Roll.new("2d6").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d12+108")
				character.weight = (110 +((character.height - 53) * Roll.new("2d6").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 1
			character.stats["dex"] += 2
			character.stats["con"] += 2
			character.ac_list["natural"] += 4
			character.skill_list.assign_misc("Move Silently", 4)
			character.add_ability("Darkvision(60ft.)")
		end
	end
end
RaceList.push(Hobgoblin)