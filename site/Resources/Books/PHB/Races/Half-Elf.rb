# Half-Elf - Model of D&D race and container for related information
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

#--== Half-Elf ============================================================================#
#++
class HalfElf< RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("3d6+20")
		@favored_classes = ClassList.list.keys
		character.languages.learn_lang("Elven")
		@bonus_languages = []
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d8+55")
				character.weight = (100 +((character.height - 55) * Roll.new("2d4").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d8+53")
				character.weight = (80 +((character.height - 53) * Roll.new("2d4").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end                   
			character.skill_list.assign_misc("Listen", 1)
			character.skill_list.assign_misc("Spot", 1)
			character.skill_list.assign_misc("Search", 1)
			character.skill_list.assign_misc("Gather Information", 2)
			character.skill_list.assign_misc("Diplomacy", 2)
			character.add_ability("Low-Light Vision")
			character.add_ability("Immune to magic sleep effects")
			character.add_ability("+2 Saves vs Enchantment Spells/Effects")
		end
	end
end
RaceList.push(HalfElf)