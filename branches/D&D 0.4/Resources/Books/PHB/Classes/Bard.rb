# Bard - Model of D&D skills and container for related information
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

#require "RaceList"
#require 'pathname' 
#require Pathname(__FILE__).ascend{|d| h=d+'ClassList.rb'; break h if h.file?} 

#--== Bard =============================================================================#
#++
class Bard < ClassModel
	def initialize (character)
		super(character)
		@hd_type="1d6"
		@base_skill_num = 6
		@will = GOOD_SAVE
		@fort = BAD_SAVE
		@reflex = GOOD_SAVE
		@bab = MID_BAB
		@class_skills = ["Appraise","Balance","Bluff","Climb","Concentraion", "Craft",
    "Decipher Script","Diplomacy","Disguise","Escape Artist", "Gather Information",
    "Hide", "Jump", "Knowledge", "Listen", "Move Silently", "Perform", "Profession",
    "Sense Motive", "Sleight of Hand", "Speak Language", "Spellcraft", "Swim", "Tumble",
    "Use Magic Device" ]
		apply
	end
	
	def available?
		super
		#[TODO] any non-lawful
	end
  
	def apply#(char)
		super
    #[NOTE] Add weapon proficiencies 
    #[NOTE][QUESTION] should perform be a prefered skill?
		#level = super(char)
		#class_level = level.class_level #for visibility
		#Class Features :
		#rage          
		@character.increase_ability("Inspire Courage",1,"+") if [1,8,14,20].include?(@class_level)

		#class abilities
		case class_level
			when 1  
        @character.add_ability("Bardic Music")
        @character.add_ability("Bardic Knowledge")
        @character.add_ability("Countersong")
        @character.add_ability("Fascinate")
      when 3 then @character.add_ability("Inspire Competence")
      when 6 then @character.add_ability("Suggestion")
      when 9 then @character.add_ability("Inspire greatness")
      when 12 then @character.add_ability("Song of freedom")
      when 15 then @character.add_ability("Inspire heroics")
      when 18 then @character.add_ability("Mass Suggestion")
		end
	end
end
ClassList.push(Bard)