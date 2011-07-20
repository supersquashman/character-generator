# Fighter - D&D class model and container for related information
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

#--== Fighter ============================================================================#
#++
class Fighter < ClassModel
	def initialize (character)
		super(character)
		@hd_type="1d10"
		@base_skill_num = 2
		@will = BAD_SAVE
		@fort = GOOD_SAVE
		@reflex = BAD_SAVE
		@bab = GOOD_BAB
		@class_skills = ["Climb", "Craft", "Handle Animal", "Intimidate", "Jump", "Ride", "Swim"]
		apply
	end
	
	def apply
		super
    if @class_level == 1
      @character.weapon_proficiencies |= ["Martial","Simple"]
      @character.armor_proficiencies |= ["Heavy","Medium","Light","Shields","Tower Shield"]
    end
		#Class Features :
		#bonus feats    
		(@class_level == 1 || @class_level %2>0) ? FeatList.get_bonus_feat(@character, "Fighter") : 0
	end
end
ClassList.push(Fighter)