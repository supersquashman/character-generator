# Wood Elf - Model of D&D race and container for related information
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

#--== WoodElf ============================================================================#
#++
class WoodElf< Elf

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@favored_classes=["Ranger"]
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
    #in addition to elf
    character.stats["str"] += 2
    character.stats["int"] -= 2
	end
end
RaceList.push(WoodElf)