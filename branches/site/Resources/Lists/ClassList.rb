# ClassList - Manager of D&D Classes[ClassModel]
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

require "#{File.dirname(__FILE__)}/../Models/ClassModel"

#--== ClassList ========================================================================#
#++
class ClassList
	@@list=Hash.new
#-- list -------------------------------------------------------------------------------#
#++
	def list
		return @@list
	end
  
#-- self.push(classes) -----------------------------------------------------------------#
#++
	def self.push(classs)
		@@list[classs.to_s] = classs
	end
  
#-- self.list --------------------------------------------------------------------------#
#++
	def self.list
		return @@list
	end
end