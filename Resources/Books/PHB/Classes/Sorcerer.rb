# Sorcerer - D&D class model and container for related information
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

require_relative "../Magic/Spells/SorcererSpells"

#--== Sorcerer =========================================================================#
#++
class Sorcerer < ClassModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize (character)
		super(character)
		@hd_type="1d4"
		@base_skill_num = 2
		@will = GOOD_SAVE
		@fort = BAD_SAVE
		@reflex = BAD_SAVE
		@bab = BAD_BAB
		@class_skills = ["Bluff","Concentraion", "Craft", "Knowledge(Arcana)", "Profession", "Spellcraft"]
		apply
	end
  
#-- apply ------------------------------------------------------------------------------#
#++
	def apply#(char)
		super
		#[NOTE][QUESTION] should spellcraft be a prefered skill?
			#Class Features :
		#spells
		Sorcerer.increase_spells(@character,@class_level)

		#class abilities
		if @class_level == 1  
        @character.weapon_proficiencies |= $SIMPLE_WEAPONS
        @character.armor_proficiencies |= []
        @character.add_ability("Summon Familiar") #[TODO] Familiar rules
		end
		@character.caster_level +=1
	end
	
	def self.increase_spells(character, class_level)
		spells_per_day_table = [
		[5,3,0,0,0,0,0,0,0,0],
		[6,4,0,0,0,0,0,0,0,0],
		[6,5,0,0,0,0,0,0,0,0],
		[6,6,3,0,0,0,0,0,0,0],
		[6,6,4,0,0,0,0,0,0,0],
		[6,6,5,3,0,0,0,0,0,0],
		[6,6,6,4,0,0,0,0,0,0],
		[6,6,6,5,3,0,0,0,0,0],
		[6,6,6,6,4,0,0,0,0,0],
		[6,6,6,6,5,3,0,0,0,0],
		[6,6,6,6,6,4,0,0,0,0],
		[6,6,6,6,6,5,3,0,0,0],
		[6,6,6,6,6,6,4,0,0,0],
		[6,6,6,6,6,6,5,3,0,0],
		[6,6,6,6,6,6,6,4,0,0],
		[6,6,6,6,6,6,6,5,3,0],
		[6,6,6,6,6,6,6,6,4,0],
		[6,6,6,6,6,6,6,6,5,3],
		[6,6,6,6,6,6,6,6,6,4],
		[6,6,6,6,6,6,6,6,6,6]]

		SpellList.table_row(spells_per_day_table,class_level-1) do |val, i| 
			character.spells.set_spells_per_day((val+SpellList.bonus_spells(character.stat_mod["cha"], i)),i.to_s,"Sorcerer")
		end
		spell_table = [
		[4,2,0,0,0,0,0,0,0,0],
		[5,2,0,0,0,0,0,0,0,0],
		[5,3,0,0,0,0,0,0,0,0],
		[6,3,1,0,0,0,0,0,0,0],
		[6,4,2,0,0,0,0,0,0,0],
		[7,4,2,1,0,0,0,0,0,0],
		[7,5,3,2,0,0,0,0,0,0],
		[8,5,3,2,1,0,0,0,0,0],
		[8,5,4,3,2,0,0,0,0,0],
		[9,5,4,3,2,1,0,0,0,0],
		[9,5,5,4,3,2,0,0,0,0],
		[9,5,5,4,3,2,1,0,0,0],
		[9,5,5,4,4,3,2,0,0,0],
		[9,5,5,4,4,3,2,1,0,0],
		[9,5,5,4,4,4,3,2,0,0],
		[9,5,5,4,4,4,3,2,1,0],
		[9,5,5,4,4,4,3,3,2,0],
		[9,5,5,4,4,4,3,3,2,1],
		[9,5,5,4,4,4,3,3,3,2],
		[9,5,5,4,4,4,3,3,3,3]]

		SpellList.table_row(spell_table,class_level - 1) do |val,i|
		  if character.stats["cha"] >= i+10 && character.spells.per_day["Sorcerer"][i.to_s] > 0
			character.spells.roll_spells(val,i.to_s,"Sorcerer")
		  end
		end
	end
end
ClassList.push(Sorcerer)