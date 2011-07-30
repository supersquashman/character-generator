# Gnome - Model of D&D race and container for related information
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

#--== Gnome ============================================================================#
#++
class Gnome< RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@size = "Small"
		@speed = 20
		@age_roll = Roll.new("9d6+40")
		@favored_classes=["Bard"]
		character.languages.learn_lang("Gnome")
		@bonus_languages = ["Draconic", "Dwarven", "Elven", "Giant", "Goblin", "Orc"]
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		super
		if(character.level <= 1)
			if (character.sex == "Male") #male
				character.height = Roll.new("2d4+36")
				character.weight = (40 +(character.height - 36)) #extra weight for gnomes and halflings is just the poundage from extra height
			end
			if (character.sex == "Female") #female
				character.height = Roll.new("2d4+34")
				character.weight = (35 +(character.height - 34)) #extra weight for gnomes and halflings is just the poundage from extra height
			end
			character.stats["con"] += 2
			character.stats["str"] -= 2                     
			character.skill_list.assign_misc("Listen", 2)
			character.skill_list.assign_misc("Craft(Alchemy)", 2)
			character.skill_list.assign_misc("Search", 2)
			character.add_ability("Low-Light Vision")
			character.add_ability("Weapon Familiarity (Gnome Hooked Hammers)")
			character.final_levelup_procs += [Proc.new do |char|
				if (character.weapon_proficiencies & $MARTIAL_WEAPONS) == $MARTIAL_WEAPONS
					character.weapon_proficiencies |= ["Gnome Hooked Hammer"]
					end
				end]
			character.add_ability("Spell-Like Ability: 1/day Speak with Animals(burrowing animals)")
			if(character.stats["cha"] >= 10)
				character.add_ability("Spell-Like Ability: 1/day Dancing Lights")
				character.add_ability("Spell-Like Ability: 1/day Ghost Sound")
				character.add_ability("Spell-Like Ability: 1/day Prestidigitation")
			end
			character.add_ability("+1 to DC of saving throws against Illusion spells cast by gnomes")
			character.add_ability("+2 Saves vs Illusion Spells")
			character.add_ability("+1 on Attack rolls against kobolds and goblinoids")
			character.add_ability("+4 dodge on AC vs Giant Monsters")
		end
	end
end
RaceList.push(Gnome)