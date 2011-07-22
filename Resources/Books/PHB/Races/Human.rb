# Human - Model of D&D race and container for related information
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

#--== Human ============================================================================#
#++
class Human < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("2d6+15")
		@favored_classes = ClassList.list.keys #All classes
		@bonus_languages = [] #All languages
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if character.level <= 1
			if (character.sex == 0) #male
				character.height = Roll.new("2d10+58")
				character.weight = (120 +((character.height - 58) * Roll.new("2d4").to_i)) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == 1) #female
				character.height = Roll.new("2d10+53")
				character.weight = (85 +((character.height - 53) * Roll.new("2d4").to_i))#extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.skill_list.roll_skills(4,[],0)
			FeatList.roll_feats(character,1)
		else
			character.skill_list.roll_skills(1,[],character.classes.length)
		end
	end
end
RaceList.push(Human)