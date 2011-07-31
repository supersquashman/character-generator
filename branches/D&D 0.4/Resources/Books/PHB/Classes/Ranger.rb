# Ranger - D&D class model and container for related information
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

require_relative "../Magic/Spells/RangerSpells"

#--== Ranger ===========================================================================#
#++
class Ranger < ClassModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize (character)
		super(character)
		@hd_type="1d8"
		@base_skill_num = 6
		@will = BAD_SAVE
		@fort = GOOD_SAVE
		@reflex = GOOD_SAVE
		@bab = GOOD_BAB
		@class_skills = ["Concentraion", "Craft", "Climb", "Handle Animal",
    "Profession", "Jump", "Heal", "Hide", "Ride", "Move Silently", "Search",
    "Spot", "Survival", "Swim", "Listen", "Use Rope"]
    knowledge = ["Nature", "Geography", "Dungeoneering"]
		knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
    @class_skills += knowledge
		apply
	end

#-- apply ------------------------------------------------------------------------------#
#++
	def apply#(char)
    Ranger.increase_spells(@character, @class_level)
		super

		#class abilities
		if class_level == 1  
		@character.weapon_proficiencies |=  $SIMPLE_WEAPONS | $MARTIAL_WEAPONS
		@character.armor_proficiencies |= $ARMOR_LIGHT  | $SHIELDS
    
		@character.add_ability("Track")
    @character.add_ability("Wild Empathy")
		end
    #favored enemy [1,5,10,15,20]
    case class_level
    when 2 
    #combat style
    when 3 
    #endurance
    when 4 then @character.add_ability("Animal Companion")
    when 6 
    #improved comat style
    when 7 then @character.add_ability("Woodland Stride")
    when 8 then @character.add_ability("Swift Tracker")
    when 9 then @character.add_ability("Evasion")
    when 11 
    #comat style mastery
    when 13 then @character.add_ability("Camouflage")
    when 17 then @character.add_ability("Hide in Plain Sight")
    end
		@character.caster_level +=1
	end
	def self.increase_spells(character, class_level)
		spell_table = [
    [-1, -1, -1, -1],
    [-1, -1, -1, -1],
    [-1, -1, -1, -1],
    [0,  -1, -1, -1],
    [0,  -1, -1, -1],
    [1,  -1, -1, -1],
    [1,  -1, -1, -1],
    [1,  0,  -1, -1],
    [1,  0,  -1, -1],
    [1,  1,  -1, -1],
    [1,  1,  0,  -1],
    [1,  1,  1,  -1],
    [1,  1,  1,  -1],
    [2,  1,  1,  0 ],
    [2,  1,  1,  1 ],
    [2,  2,  1,  1 ],
    [2,  2,  2,  1 ],
    [3,  2,  2,  1 ],
    [3,  3,  3,  2 ],
    [3,  3,  3,  3 ]]
		SpellList.table_row(spell_table,class_level - 1) do |val,i|
		  if character.stats["wis"] >= i+10
			character.spells.roll_spells(val + SpellList.bonus_spells(character.stat_mod["wis"], i+1),(i+1).to_s,"Ranger", true) if val >= 0 
		  end
		end
	end
end
ClassList.push(Ranger)