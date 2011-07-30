# Wizard - D&D class model and container for related information
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

require_relative "../Magic/Spells/WizardSpells"

#--== Wizard ===========================================================================#
#++
class Wizard < ClassModel

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
		@class_skills = ["Concentraion", "Craft", "Decipher Script", "Profession", "Spellcraft"]
    knowledge = ["Military","Arcana","Architecture and Engineering","Dungeoneering","Geography",
    "History","Local","Nature","Nobility and Royalty","Psionics","Religion","The Planes"]
		knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
    @class_skills += knowledge
		apply
	end
  
#-- apply ------------------------------------------------------------------------------#
#++
	def apply#(char)
		super
		#[NOTE][QUESTION] should spellcraft be a prefered skill?
			#Class Features :
		Wizard.increase_spells(@character, @class_level)

		#class abilities
		if class_level == 1  
		@character.weapon_proficiencies |= ["Club", "Dagger", "Heavy Crossbow", "Light Crossbow", "Quarterstaff"]
		@character.armor_proficiencies |= []
		@character.add_ability("Summon Familiar") #[TODO] Familiar rules
		@character.add_ability("Scribe Scroll") 
		#[TODO] Spell Specialization
		end
		
		@character.caster_level +=1
		
		FeatList.get_bonus_feat(@character, "Wizard") if [5,10,15,20].include?(@class_level)#(@class_level.to_i%5 == 0)
	end
	
	def self.increase_spells(character, class_level)
		#spells
		#[TODO] Generate Spell Book
		spell_table = [
		[3,1,0,0,0,0,0,0,0,0],
		[4,2,0,0,0,0,0,0,0,0],
		[4,2,1,0,0,0,0,0,0,0],
		[4,3,2,0,0,0,0,0,0,0],
		[4,3,2,1,0,0,0,0,0,0],
		[4,3,3,2,0,0,0,0,0,0],
		[4,4,3,2,1,0,0,0,0,0],
		[4,4,3,3,2,0,0,0,0,0],
		[4,4,4,3,2,1,0,0,0,0],
		[4,4,4,3,3,2,0,0,0,0],
		[4,4,4,4,3,2,1,0,0,0],
		[4,4,4,4,3,3,2,0,0,0],
		[4,4,4,4,4,3,2,1,0,0],
		[4,4,4,4,4,3,3,2,0,0],
		[4,4,4,4,4,4,3,2,1,0],
		[4,4,4,4,4,4,3,3,2,0],
		[4,4,4,4,4,4,4,3,2,1],
		[4,4,4,4,4,4,4,3,3,2],
		[4,4,4,4,4,4,4,4,3,3],
		[4,4,4,4,4,4,4,4,4,4]]

		SpellList.table_row(spell_table,class_level - 1) do |val,i|
		  if character.stats["int"] >= i+10
			character.spells.roll_spells(val+SpellList.bonus_spells(character.stat_mod["int"], i),i.to_s,"Wizard", true)
		  end
		end
	end
end
ClassList.push(Wizard)