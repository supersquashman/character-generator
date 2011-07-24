# Halfling - Model of D&D race and container for related information
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

#--== Halfling ============================================================================#
#++
class Halfling< RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Small"
		@speed = 20
		@age_roll = Roll.new("4d6+20")
		@favored_classes=["Rogue"]
		character.languages.learn_lang("Halfling")
		@bonus_languages = ["Dwarven", "Elven", "Gnome", "Goblin", "Orc"]
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d4+32")
				character.weight = (30 +(character.height - 32)) #extra weight for gnomes and halflings is just the poundage from extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d4+30")
				character.weight = (25 +(character.height - 30)) #extra weight for gnomes and halflings is just the poundage from extra height
			end
			character.stats["dex"] += 2
			character.stats["str"] -= 2                     
			character.skill_list.assign_misc("Jump", 2)
			character.skill_list.assign_misc("Climb", 2)
			character.skill_list.assign_misc("Move Silently", 2)
			character.skill_list.assign_misc("Listen", 2)
			character.add_ability("+1 on all Saves")
			character.add_ability("+2 Morale vs Fear (Stacks with +1 racial bonus)")
			character.add_ability("+1 on attacks with thrown weapons and slings")
		end
	end
end
RaceList.push(Halfling)