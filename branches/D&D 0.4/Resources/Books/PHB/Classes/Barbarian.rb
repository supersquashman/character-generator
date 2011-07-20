# Barbarian - D&D class model and container for related information
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

#--== Barbarian ========================================================================#
#++
class Barbarian < ClassModel
	def initialize (character)
		super(character)
		@hd_type="1d12"
		@base_skill_num = 4
		@will = BAD_SAVE
		@fort = GOOD_SAVE
		@reflex = BAD_SAVE
		@bab = GOOD_BAB
		@class_skills = ["Climb","Craft","Handle Animal","Intimidate",
                      "Jump","Listen","Ride","Survival","Swim"]
		apply
	end
	
	def available?
		super
		#[TODO] any non-lawful
	end
  
	def apply#(char)
    if rand(20)==0 && @character.abilities.include?("Illiteracy")
      @character.abilities.delete("Illiteracy")
      @base_skill_num -=2
    end
		super
		#Class Features :
		#rage          
		@character.increase_ability("Rage 1/day",1,"") if [1,4,8,12,16,20].include?(@class_level)
		#trap sense
		@character.increase_ability("Trap Sense") if [3,6,9,12,15,18].include?(@class_level)
		#damage reduction
		@character.increase_ability("Damage Reduction 1/-",1,"") if [7,10,13,16,19].include?(@class_level)

		#class abilities
		case class_level
			when 1  
        @character.weapon_proficiencies |= ["Martial","Simple"]
        @character.armor_proficiencies |= ["Light","Medium","Shields"]
        @character.add_ability("Fast movement")
        @character.speed += 10
        @character.add_ability("Illiteracy")
        @character.final_levelup_procs += [Proc.new do |char|
          non_barb = char.classes.reject {|val| val.class == Barbarian}.size
          char.abilities.delete("Illiteracy") if non_barb > 0
        end]
			when 2,5 then 
				if (@character.abilities.include?("Uncanny Dodge")) 
					@character.add_ability("Improved Uncanny Dodge")
				else
					@character.add_ability("Uncanny Dodge") #flat footed ac problem
				end
			when 11 then @character.add_ability("Greater Rage")
			when 14 then @character.add_ability("Indomitable Will")
			when 17 then @character.add_ability("Tireless Rage")
			when 20 then @character.add_ability("Mighty Rage")
		end
	end
end
ClassList.push(Barbarian)