# RaceModel - Model of D&D race and container for related information
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

require_relative "../Roll"

#--== RaceModel ========================================================================#
#++
class RaceModel
	attr_accessor :size, :age_roll, :speed, :favored_classes, :bonus_languages, :character, :racial_HD
	
#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		@racial_HD = "0d0"
		@character =character
		@size = "Medium"
		@speed = 30
		@age_roll = Roll.new("2d6+15")
		@favored_classes=[]
		@bonus_languages = []
	end     
  
#-- self.apply(character) --------------------------------------------------------------#
#++
	def self.apply(character)
		character.race= self.new(character)
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		#routines that are made every level
		if character.level <= 1
			character.speed = speed
			character.size = size
			age_roll.make_rolls
			character.age = age_roll.to_i#weighted_age(age_roll.to_i)
			character.languages.bonus_languages += bonus_languages
			character.stat_mod["int"].times {character.languages.roll_lang(true)}
		end
	end
	
#-- to_s -------------------------------------------------------------------------------#
#++
	def to_s
		String name = self.class.to_s.dup
		name.gsub!(/::/, '/')
		name.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1 \2')
		name.gsub!(/([a-z\d])([A-Z])/,'\1 \2')
		name.tr!("-", "_")
		return name
	end
  
#-- weighted_age(age, weight) ----------------------------------------------------------#
#++
	def weighted_age(age, weight=Array.new(100,1)+Array.new(50,1)+Array.new(25,3)+Array.new(10,4)+Array.new(2,0.5))
		return (age*(weight [rand(weight.length)])).to_i
	end
	
#-- is_template ------------------------------------------------------------------------#
#++
	def self.is_template
		return false
	end
end