# Druid - D&D class model and container for related information
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

require "#{File.dirname(__FILE__)}/../Magic/Spells/DruidSpells"

#--== Druid ===========================================================================#
#++
class Druid < ClassModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize (character)
		super(character)
		@hd_type="1d8"
		@base_skill_num = 4
		@will = GOOD_SAVE
		@fort = GOOD_SAVE
		@reflex = BAD_SAVE
		@bab = MID_BAB
		@class_skills = ["Concentraion", "Craft", "Diplomacy", "Handle Animal", "Spellcraft", 
		"Profession", "Heal", "Listen", "Swim", "Ride", "Spot", "Survival"]
		knowledge = ["Nature"]
		knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
		@class_skills += knowledge
	end
#-- availiable? ------------------------------------------------------------------------#
#++
	def available?
		available = super
		available &&= ["Neutral Good","Chaotic Neutral","Neutral","Lawful Neutral","Neutral Evil"].include?( @character.alignment )
		available
	end
  
  
#-- apply ------------------------------------------------------------------------------#
#++
	def apply#(char)
    fcheck = {"Evil"=>["Good"], "Good"=>["Evil"], "Lawful"=>["Chaotic","Chaos"], "Chaotic"=>["Lawful","Law"]}
    forbidden = character.alignment.split.collect{|a| fcheck[a]}.flatten.select{|a| ["Evil","Good","Chaotic","Chaos","Lawful","Law"].include?(a)}
    character.spells.forbidden_types["Druid"] = forbidden
		Druid.increase_spells(@character, @class_level)
		super
    
		@character.add_ability("Wild Empathy Checks +2 Synergy") if @character.skill_list.get_ranks("Knowledge(Religion)") >=5
		#class abilities
		if class_level == 1  
			@character.languages.bonus_languages += ["Sylvan"]
			@character.languages.learn_lang("Druidic")
			@character.weapon_proficiencies |=  ["Dagger", "Club",	"Shortspear", "Quarterstaff", "Spear", "Sling","Dart", "Scimitar", "Sickle"]
			#non metal armor?
			@character.armor_proficiencies |= $LIGHT_ARMOR | $MEDIUM_ARMOR | ["Buckler", "Light Wooden Shield", "Heavy Wooden Shield"]
		
			@character.add_ability("Animal Companion")
			@character.add_ability("Wild Empathy")
			#@character.add_ability("Nature Sense")
			@character.skill_list.assign_misc("Knowledge(Nature)", 2)
			@character.skill_list.assign_misc("Survival", 2)
			@character.add_ability("Spontaneous Casting(Summon Nature's Ally)")
		end
		@character.increase_ability("Wild Shape(1/day)",1,"") if [5,6,7,10,14,18].include?(@class_level)
		@character.increase_ability("Wild Shape Elemental(1/day)",1,"") if [16,18,20].include?(@class_level)
		case class_level
			when 2 then @character.add_ability("Woodland Stride")
			when 3 then @character.add_ability("Trackless Step")
			when 4 then @character.add_ability("Resist Nature's Lure")
			when 8 then @character.add_ability("Wild Shape(Large)")
			when 9 then @character.add_ability("Venom Immunity")
			when 11 then @character.add_ability("Wild Shape(Tiny)")
			when 12 then @character.add_ability("Wild Shape(Plant)")
			when 13 then @character.add_ability("A thounsand faces")
			when 15
				@character.add_ability("Timeless Body")
				@character.add_ability("Wild Shape(Huge)")
			when 20 then @character.add_ability("Wild Shape Elemental(Huge)")
		end
		@character.caster_level +=1
	end
	
	def self.increase_spells(character, class_level)
		spell_table = [
		[3, 1, 0, 0, 0, 0, 0, 0, 0, 0],
		[4, 2, 0, 0, 0, 0, 0, 0, 0, 0],
		[4, 2, 1, 0, 0, 0, 0, 0, 0, 0],
		[5, 3, 2, 0, 0, 0, 0, 0, 0, 0],
		[5, 3, 2, 1, 0, 0, 0, 0, 0, 0],
		[5, 3, 3, 2, 0, 0, 0, 0, 0, 0],
		[6, 4, 3, 2, 1, 0, 0, 0, 0, 0],
		[6, 4, 3, 3, 2, 0, 0, 0, 0, 0],
		[6, 4, 4, 3, 2, 1, 0, 0, 0, 0],
		[6, 4, 4, 3, 3, 2, 0, 0, 0, 0],
		[6, 5, 4, 4, 3, 2, 1, 0, 0, 0],
		[6, 5, 4, 4, 3, 3, 2, 0, 0, 0],
		[6, 5, 5, 4, 4, 3, 2, 1, 0, 0],
		[6, 5, 5, 4, 4, 3, 3, 2, 0, 0],
		[6, 5, 5, 5, 4, 4, 3, 2, 1, 0],
		[6, 5, 5, 5, 4, 4, 3, 3, 2, 0],
		[6, 5, 5, 5, 5, 4, 4, 3, 2, 1],
		[6, 5, 5, 5, 5, 4, 4, 3, 3, 2],
		[6, 5, 5, 5, 5, 5, 4, 4, 3, 3],
		[6, 5, 5, 5, 5, 5, 4, 4, 4, 4]]
		SpellList.table_row(spell_table,class_level - 1) do |val,i|
			if character.stats["wis"] >= i+10
				character.spells.roll_spells(val + SpellList.bonus_spells(character.stat_mod["wis"], i),i.to_s,"Druid", true) if val > 0 
			end
		end
	end
end
ClassList.push(Druid)