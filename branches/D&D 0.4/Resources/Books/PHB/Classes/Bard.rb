# Bard - D&D class model and container for related information
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

require_relative "../Magic/Spells/BardSpells"

#--== Bard =============================================================================#
#++
class Bard < ClassModel

#-- initialize(character) --------------------------------------------------------------#
#++
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
    "Hide", "Jump", "Listen", "Move Silently", "Perform", "Profession",
    "Sense Motive", "Sleight of Hand", "Speak Language", "Spellcraft", "Swim", "Tumble",
    "Use Magic Device" ]
    knowledge = ["Military","Arcana","Architecture and Engineering","Dungeoneering","Geography",
    "History","Local","Nature","Nobility and Royalty","Psionics","Religion","The Planes"]
		knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
    @class_skills += knowledge
		apply
	end
  
#-- availiable? ------------------------------------------------------------------------#
#++
	def available?
		super
		#[TODO] any non-lawful
	end
  
#-- apply ------------------------------------------------------------------------------#
#++
	def apply#(char)
		super
		#[NOTE][QUESTION] should perform be a prefered skill?
			#Class Features :
		#inspire courage
			@character.increase_ability("Inspire Courage",1,"+") if [1,8,14,20].include?(@class_level)
		Bard.increase_spells(@character, @class_level)

			#class abilities
			case class_level
				when 1  
			@character.weapon_proficiencies |= ["Simple", "Longsword", "Rapier", "Sap", "Short Sword", "Shortbow", "Whip"]
			@character.armor_proficiencies |= ["Light","Shields"]
			@character.add_ability("Bardic Music")
			@character.add_ability("Bardic Knowledge")
			@character.add_ability("Countersong")
			@character.add_ability("Fascinate")
		  when 3 then @character.add_ability("Inspire Competence")
		  when 6 then @character.add_ability("Suggestion")
		  when 9 then @character.add_ability("Inspire Greatness")
		  when 12 then @character.add_ability("Song of Freedom")
		  when 15 then @character.add_ability("Inspire Heroics")
		  when 18 then @character.add_ability("Mass Suggestion")
		end
	end
	
	def self.increase_spells(character, class_level)
		#spells
		spells_per_day_table = [
		[3,0,0,0,0,0,0],
		[3,1,0,0,0,0,0],
		[3,2,0,0,0,0,0],
		[3,3,1,0,0,0,0],
		[3,3,2,0,0,0,0],
		[3,3,2,0,0,0,0],
		[3,3,3,1,0,0,0],
		[3,3,3,2,0,0,0],
		[3,3,3,2,0,0,0],
		[3,3,3,3,1,0,0],
		[3,3,3,3,2,0,0],
		[3,3,3,3,2,0,0],
		[4,3,3,3,3,1,0],
		[4,4,3,3,3,2,0],
		[4,4,4,3,3,2,0],
		[4,4,4,4,3,3,1],
		[4,4,4,4,4,3,2],
		[4,4,4,4,4,4,3],
		[4,4,4,4,4,4,4]]
		SpellList.table_row(spells_per_day_table,class_level-1) do |val, i| 
			character.spells.set_spells_per_day((val+SpellList.bonus_spells(character.stat_mod["cha"], i)),i.to_s,"Bard")
		end
		spell_table = [
		[5,2,0,0,0,0,0],
		[6,3,0,0,0,0,0],
		[6,3,2,0,0,0,0],
		[6,4,3,0,0,0,0],
		[6,4,3,0,0,0,0],
		[6,4,4,2,0,0,0],
		[6,4,4,3,0,0,0],
		[6,4,4,3,0,0,0],
		[6,4,4,4,2,0,0],
		[6,4,4,4,3,0,0],
		[6,4,4,4,3,0,0],
		[6,4,4,4,4,2,0],
		[6,4,4,4,4,3,0],
		[6,4,4,4,4,3,0],
		[6,5,4,4,4,4,2],
		[6,5,5,4,4,4,3],
		[6,5,5,5,4,4,3],
		[6,5,5,5,5,4,4],
		[6,5,5,5,5,5,4]]
		SpellList.table_row(spell_table,class_level - 1) do |val,i| 
			if character.stats["cha"] >= i+10 && character.spells.per_day["Bard"][i.to_s] > 0
			  character.spells.roll_spells(val,i.to_s,"Bard") 
			end
		end
	end
end
ClassList.push(Bard)