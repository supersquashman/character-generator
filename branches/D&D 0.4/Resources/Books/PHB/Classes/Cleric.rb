# Cleric - D&D class model and container for related information
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

require_relative "../Magic/Spells/ClericSpells"

#--== Cleric ===========================================================================#
#++
class Cleric < ClassModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize (character)
		super(character)
		@hd_type="1d8"
		@base_skill_num = 2
		@will = GOOD_SAVE
		@fort = BAD_SAVE
		@reflex = GOOD_SAVE
		@bab = MID_BAB
		@class_skills = ["Concentraion", "Craft", "Diplomacy", "Spellcraft", "Profession", "Heal"]
    knowledge = ["Arcana", "History", "Religion", "The Planes"]
		knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
    @class_skills += knowledge
		apply
	end
  
#-- apply ------------------------------------------------------------------------------#
#++
	def apply#(char)
		super
		Cleric.increase_spells(@character, @class_level)

		#class abilities
		if class_level == 1  
    @character.languages.bonus_languages += ["Celestial", "Abyssal", "Infernal"]
		@character.weapon_proficiencies |= $SIMPLE_WEAPONS
		@character.armor_proficiencies |= $ARMOR_HEAVY | $ARMOR_LIGHT | $ARMOR_MED | $SHIELDS
		@character.add_ability("Turn or Rebuke Undead")
    @character.add_ability("Spontaneous Casting(Cure or Inflict)")
    @character.add_ability("Aura(" + @character.alignment.scan(/Good|Evil|Lawful|Chaotic/).join(" ").to_s + ")")
		end
	end
	#[TODO] Domains and Spells
	def self.increase_spells(character, class_level)
		spell_table = [
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
    [2, 0, 0, 0, 0, 0, 0, 0, 0],
    [2, 1, 0, 0, 0, 0, 0, 0, 0],
    [3, 2, 0, 0, 0, 0, 0, 0, 0],
    [3, 2, 1, 0, 0, 0, 0, 0, 0],
    [3, 3, 2, 0, 0, 0, 0, 0, 0],
    [4, 3, 2, 1, 0, 0, 0, 0, 0],
    [4, 3, 3, 2, 0, 0, 0, 0, 0],
    [4, 4, 3, 2, 1, 0, 0, 0, 0],
    [4, 4, 3, 3, 2, 0, 0, 0, 0],
    [5, 4, 4, 3, 2, 1, 0, 0, 0],
    [5, 4, 4, 3, 3, 2, 0, 0, 0],
    [5, 5, 4, 4, 3, 2, 1, 0, 0],
    [5, 5, 4, 4, 3, 3, 2, 0, 0],
    [5, 5, 5, 4, 4, 3, 2, 1, 0],
    [5, 5, 5, 4, 4, 3, 3, 2, 0],
    [5, 5, 5, 5, 4, 4, 3, 2, 1],
    [5, 5, 5, 5, 4, 4, 3, 3, 2],
    [5, 5, 5, 5, 5, 4, 4, 3, 3],
    [5, 5, 5, 5, 5, 4, 4, 4, 4]]

		SpellList.table_row(spell_table,class_level - 1) do |val,i|
		  if character.stats["wis"] >= i+10
			character.spells.roll_spells(val + SpellList.bonus_spells(character.stat_mod["wis"], i),i.to_s,"Cleric", true)
		  end
		end
	end
end
ClassList.push(Cleric)
