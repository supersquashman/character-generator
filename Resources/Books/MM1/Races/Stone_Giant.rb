# Stone Giant - Model of D&D race and container for related information
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

#--== Stone Giant ============================================================================#
#++
class StoneGiant < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Large"
		@speed = 40
		@age_roll = Roll.new("25d10+200")
		@favored_classes=["Barbarian"]
		character.languages.learn_lang("Giant")
		@bonus_languages = ["Common", "Draconic", "Elven", "Goblin", "Orc"]
		@racial_HD = "12d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			character.height = Roll.new("2d12+132")
			character.weight = (character.height.to_i * 10.41).floor
			character.ECL += 4
			character.HD += 14
			character.HP += Roll.new(@racial_HD).to_i
			character.BAB += 10
			#character.feats
			character.stats["str"] += 16
			character.stats["wis"] += 2
			character.stats["con"] += 8
			character.stats["dex"] += 4
			character.fort_save["racial"] = 9
			character.ref_save["racial"] = 4
			character.will_save["racial"] = 4
			character.ac_list["natural"] += 11
			FeatList.roll_feats(character, 4)
			character.add_ability("Darkvision(60ft.)")
			character.add_ability("Low-Light Vision")
			character.add_ability("Rock Catching")
			num_skills = (character.stat_mod["int"] + 2) * 17
			character.skill_list.class_skills = ["Climb","Hide","Listen","Spot"]
			character.skill_list.roll_skills(num_skills)
		end
	end
end
RaceList.push(StoneGiant)