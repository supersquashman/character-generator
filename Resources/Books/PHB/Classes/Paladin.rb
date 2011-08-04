# Paladin - D&D class model and container for related information
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

require_relative "../Magic/Spells/PaladinSpells"

#--== Paladin ===========================================================================#
#++
class Paladin < ClassModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize (character)
		super(character)
		@hd_type="1d10"
		@base_skill_num = 2
		@will = BAD_SAVE
		@fort = GOOD_SAVE
		@reflex = BAD_SAVE
		@bab = GOOD_BAB
		@class_skills = ["Concentraion", "Craft", "Diplomacy", "Handle Animal",
			"Profession", "Heal", "Ride", "Sense Motive"]
		knowledge = ["Religion", "Nobility and Royalty"]
		knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
		@class_skills += knowledge
	end
#-- availiable? ------------------------------------------------------------------------#
#++
	def available?
		available = super
		available &&= ["Lawful Good"].include?( @character.alignment )
		available
	end
  
  
#-- apply ------------------------------------------------------------------------------#
#++
	def apply#(char)
		Paladin.increase_spells(@character, @class_level)
		super

		#class abilities
		if class_level == 1  
			@character.weapon_proficiencies |=  $SIMPLE_WEAPONS | $MARTIAL_WEAPONS
			#non metal armor?
			@character.armor_proficiencies |= $LIGHT_ARMOR | $MEDIUM_ARMOR | $HEAVY_ARMOR | $SHIELDS
		
			@character.add_ability("Aura of Good")
			@character.add_ability("Detect Evil")
		end
		@character.increase_ability("Smite Evil(1/day)",1,"") if [1,5,10,15,20].include?(@class_level)
		@character.increase_ability("Remove Disease(1/week)",1,"") if [6,9,15,18].include?(@class_level)
		case class_level
			when 2 
				@character.add_ability("Divine Grace")
				@character.add_ability("Lay on Hands") #+cha to all saving throws
			when 3 
				@character.add_ability("Aura of Courage")
				@character.add_ability("Divine Health")
			when 4 then @character.add_ability("Turn Undead")
			when 8 then @character.add_ability("Special Mount")
		end
		@character.caster_level +=1
	end

#-- self.increase_spells(character, class_level) ------------------------------------------------------------------------------#
#++
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
				character.spells.roll_spells(val + SpellList.bonus_spells(character.stat_mod["wis"], i+1),(i+1).to_s,"Paladin", true) if val >= 0 
			end
		end
	end
end
ClassList.push(Paladin)