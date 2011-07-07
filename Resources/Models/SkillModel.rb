# SkillModel - Model of D&D skills and container for related information
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


#--== SkillModel =======================================================================#
#++
# Class models D&D skills and manages individual skill information

# Members :
# name[String] - skill name will be used for hashing, and searching, and printing
# ranks[Float] - number of ranks character has taken in skill
# description[String] - [UNUSED] a short description of skill possibly for later tool-tips or links
# mod[String] - related skill modifier. Ex: "int" (lowercase)
# armor_check[boolean] - should character's armor check penalty affect this skill?
# bonus_hash[Hash(key=origin, value=bonus)] - hash of skill bonuses. Will be used for calculating total Ex: {"Racial"=>2}
# circumstance_hash[Hash(key=origin, value=bonus)] - hash of skill circumstance bonuses. Won't be used for calculating total

# Methods : initialize, ==(skill), bonus(char)

class SkillModel
	attr_accessor :name, :ranks, :description,:mod,:armor_check, :bonus_hash, :circumstance_hash
	#bonus_hash should contain reason as key and bonus as value
	#circumstance_hash should contain reason as key and bonus as value
#-- initialize -------------------------------------------------------------------------#
#++

	def initialize (name, mod="wis",armor_check=false, description="",ranks=0)
		@name=name
		@ranks=ranks
		@mod=mod
		@armor_check=armor_check ?  armor_check=="true"? true: false : false 
		@description=description
		@bonus_hash = Hash.new
		@circumstance_hash = Hash.new
	end
#-- ==(skill) --------------------------------------------------------------------------#
#++
# comparison method will make sure that skills are always compared by name
	def ==(skill)
		if(skill.is_a?(SkillModel))
			return self.name == skill.name
		else
			return self.name ==skill
		end
	end
#-- bonus(char) ------------------------------------------------------------------------#
#++
# [DEP] marked for removal
	def bonus(char)
		b = char.stat_mod[@mod]
		return b
	end
end