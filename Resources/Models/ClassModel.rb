# ClassModel - Model of D&D skills and container for related information
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
require_relative "SpellModel"
#--== ClassModel =======================================================================#
#++
# Members :

# Methods : 
class ClassModel
	#attr_accessor :good_save,:bad_save,:good_bab,:mid_bab,:bad_bab
	attr_accessor :hd, :hd_type, :class_skills, :character, :will, :reflex, :fort, :bab, :class_level, :base_skill_num, :spells
	GOOD_SAVE = [2,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
	BAD_SAVE  = [0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0]
	GOOD_BAB  = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] #(level - GOOD_BAB.length).each {|i| (GOOD_BAB += 1) if (i>0)}
	MID_BAB   = [0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1]
	BAD_BAB   = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
	
	def initialize(character)
    @spells = Hash.new([])
		@character = character
		@hd_type = "1d4"
		@base_skill_num = 1
		@will = BAD_SAVE
		@reflex = BAD_SAVE
		@fort = BAD_SAVE
		@bab = BAD_BAB
		@class_level = character.classes.collect {|val| val.class == self}.size+1
		@hd = character.classes.length >0 ? Roll.new(hd_type) : Roll.new(hd_type).max
		@class_skills = []
		#apply
	end
	
	def self.Class_skills
			Class_skills
	end
	
	def apply
		#add an instance of this class level to the characters class list
		#level = self.new(character)
		#@character.classes.push(level)
		#roll the hd fro hd_type
		@hd = @character.classes.length >1 ? Roll.new(@hd_type) : Roll.new(@hd_type).max
		#apply the classes save bonuses to the character
		@character.fort_save["base"] += @fort[@class_level-1]
		@character.will_save["base"] += @will[@class_level-1]
		@character.ref_save["base"] += @reflex[@class_level-1]
		#apply the bab bonus to the character
		@character.BAB += @bab[@class_level-1]
		#increase the character's hp by the hit die amount + con bonus
		@character.HP += [@hd.to_i + @character.stat_mod["con"],1].max
		@character.HD += 1
		#roll this level of the character's skills (4X for first level)
		num_skills = (@base_skill_num + @character.stat_mod["int"])*(@class_level>1? 1:4)
		@character.skill_list.class_skills = @class_skills
		@character.skill_list.roll_skills(num_skills)
		#descendants will need the class reference for application of the class' abilities
		#[TODO][QUESTION] should the apply class be an instance or class method?
		#return level
	end
	
	def self.available?(character)
			return true
	end
	
	def to_s
		String name = self.class.to_s.dup
		name.gsub!(/::/, '/')
		name.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1 \2')
		name.gsub!(/([a-z\d])([A-Z])/,'\1 \2')
		name.tr!("-", "_")
		return name.to_s# + "( " +hd.to_s+" )"
	end
=begin
	def expand_saves(epic_level)
		(epic_level - GOOD_BAB.length).each {|i| (GOOD_BAB += 1) if (i>0)}
		(epic_level - BAD_BAB.length).each {|i| ((i%2 == 0) ? (BAD_BAB += 1) : (BAD_BAB += 0)) if (i>0)}
		(epic_level - MID_BAB.length).each {|i| (((i-1)%4 == 0) ? (MID_BAB += 0) : (MID_BAB += 1)) if (i>0)}
		(epic_level - GOOD_SAVE.length).each {|i| ((i%2 == 0) ? (GOOD_SAVE += 1) : (GOOD_SAVE += 0)) if (i>0)}
		(epic_level - BAD_SAVE.length).each {|i| ((i%3 == 0) ? (BAD_SAVE += 1) : (GOOD_SAVE += 0)) if (i>0)}
	end
=end
end