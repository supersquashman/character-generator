# Minotaur - Model of D&D race and container for related information
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

#--== Minotaur ============================================================================#
#++
class Minotaur < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Large"
		@speed = 30
		@age_roll = Roll.new("8d10+20")
		@favored_classes=["Barbarian"]
		character.languages.learn_lang("Giant")
		character.languages.learn_lang("Common")
		@bonus_languages = ["Common", "Draconic", "Elven", "Goblin", "Orc"]
		@racial_HD = "6d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			character.height = Roll.new("3d12+82")
			character.weight = (character.height.to_i * 8.34)
			character.ECL += 2
			character.HD += 6
			character.HP += Roll.new(@racial_HD).to_i
			character.BAB += 6
			#character.feats
			character.stats["str"] += 8
			character.stats["cha"] -= 2
			character.stats["con"] += 4
			(character.stats["int"] - 4 < 3) ? character.stats["int"] = 3 : character.stats["int"] -= 4
			character.fort_save["racial"] = 2
			character.ref_save["racial"] = 5
			character.will_save["racial"] = 5
			character.ac_list["natural"] += 5
			FeatList.roll_feats(character, 2)
			character.add_ability("Powerful Charge")
			character.add_ability("Natural Cunning")
			character.add_ability("Scent")
			character.add_ability("Natural Weapons:  Horns - Gore(1d8)")
			character.weapon_proficiencies |= $SIMPLE_WEAPONS
			character.weapon_proficiencies |= "Greateaxe"
			num_skills = (character.stat_mod["int"] + 2) * 9
			character.skill_list.class_skills = ["Intimidate","Jump","Listen","Search","Spot"]
			character.skill_list.roll_skills(num_skills)
			character.skill_list.assign_misc("Search", 4)
			character.skill_list.assign_misc("Spot", 4)
			character.skill_list.assign_misc("Listen", 4)
		end
	end
end
RaceList.push(Minotaur)