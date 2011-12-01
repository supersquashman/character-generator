# Ogre Mage - Model of D&D race and container for related information
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

#--== Ogre Mage ============================================================================#
#++
class OgreMage < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Large"
		@speed = 40
		@age_roll = Roll.new("10d10+25")
		@favored_classes=["Sorcerer"]
		character.languages.learn_lang("Common")
		character.languages.learn_lang("Giant")
		@bonus_languages = ["Dwarven", "Infernal", "Goblin", "Orc"]
		@racial_HD = "5d8"
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d12+108")
				character.weight = (character.height.to_i * 5.83) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d12+108")
				character.weight = (character.height.to_i * 5.83) #extra weight is determined by multiplying the weight multiplier by the extra height
			end
			character.ECL += 7
			character.HD += 5
			character.BAB += 5
			character.HP += Roll.new(@racial_HD).to_i
			character.stats["str"] += 10
			character.stats["cha"] += 6
			character.stats["con"] += 6
			character.stats["int"] += 4
			character.stats["wis"] += 4
			character.fort_save["racial"] = 4
			character.ref_save["racial"] = 1
			character.will_save["racial"] = 1
			character.ac_list["natural"] += 5
			FeatList.roll_feats(character, 1)
			num_skills = (character.stat_mod["int"] + 2) * 8
			character.skill_list.class_skills = ["Concentration", "Listen", "Spellcraft", "Spot"]
			character.skill_list.roll_skills(num_skills)
			character.add_ability("Darkvision(60ft.)")
			character.add_ability("Regeneration (5)")
			character.add_ability("Change Shape")
			character.add_ability("Darkness")
			character.add_ability("Invisibility") 
			character.add_ability("Charm Person (1/day)")
			character.add_ability("Cone of Cold (1/day)")
			character.add_ability("Gaseous Form (1/day)")
			character.add_ability("Sleep (1/day)")
			character.add_ability("Fly(40ft.)")
			character.spell_resist = 19
		end
	end
end
RaceList.push(OgreMage)