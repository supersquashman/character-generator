# RaceList - Manager of D&D Races[RaceModel]
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

require_relative "../Models/RaceModel"

#--== RaceList =========================================================================#
#++

class RaceList
	@@list=Hash.new
  
#-- list -------------------------------------------------------------------------------#
#++
	def list
		return @@list
	end
  
#-- self.push(race) --------------------------------------------------------------------#
#++
	def self.push(race)
		@@list[race.to_s] = race
	end
  
#-- self.list --------------------------------------------------------------------------#
#++
	def self.list
		return @@list
	end
	
#-- self.select_race() --------------------------------------------------------------------------#
#++
	def self.select_race()
		char_race = @@list.values[rand(@@list.length)]
		return char_race
	end
=begin	
#-- self.select_race(race) --------------------------------------------------------------------------#
#++
	def self.select_race(race)
		return @@list[race]
	end
=end
end

