# Vampire - Model of D&D race and container for related information
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

#--== Vampire ============================================================================#
#++
class Vampire < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		#character.final_levelup_procs.push('character.HP = Roll.new(character.HD.to_s + "d12")')
		character.final_levelup_procs += [Proc.new {character.HP = Roll.new(character.HD.to_s + "d12 + #{(character.HD * character.stat_mod["con"])}")}]
		#character.final_levelup_procs.push('@HP = Roll.new(@HD.to_s + "d12")')
	end
#-- self.apply(character) --------------------------------------------------------------#
#++
	def self.apply(character)
		character.racial_templates.push(self.new(character))
	end
  
#-- apply_level ------------------------------------------------------------------------#
#++
	def apply_level
		if(character.level <= 1)
			character.ECL += 8
			character.CR += 2
			character.stats["str"] += 6
			character.stats["dex"] += 4
			character.stats["cha"] += 4
			character.stats["wis"] += 2
			character.stats["int"] += 2
			character.ac_list["natural"] += 6
			character.remove_ability("Low-Light Vision")
			character.add_ability("Low-Light Vision")
			if (character.get_ability_level("Darkvision").to_i < 60)
				character.remove_ability("Darkvision", true)
				character.add_ability("Darkvision(60ft.)")
			end
			character.add_ability("Children of the Night")
			character.add_ability("Blood Drain")
			character.add_ability("Dominate (DC " + (character.HD/2 + 10 + character.stat_mod["cha"]).to_s + ")")
			character.add_ability("Create Spawn")
			character.add_ability("Energy Drain")
			character.add_ability("Alternate Form (Bat, Dire Bat, Wolf, Dire Wolf)")
			character.add_ability("Damage Reduction 10/silver and magic")
			character.add_ability("Fast Healing(5)")
			character.add_ability("Gaseous Form")
			character.add_ability("Spider Climb")
			character.add_ability("Turn Resistance (+4)")
			character.skill_list.assign_misc("Bluff", 8)
			character.skill_list.assign_misc("Hide", 8)
			character.skill_list.assign_misc("Spot", 8)
			character.skill_list.assign_misc("Sense Motive", 8)
			character.skill_list.assign_misc("Listen", 8)
			character.skill_list.assign_misc("Move Silently", 8)
			character.skill_list.assign_misc("Search", 8)
			if (!character.has_ability("Immunity to Cold"))
				if (character.get_ability_level("Resistance to Cold").to_i < 10)
					character.remove_ability("Resistance to Cold", true)
					character.add_ability("Resistance to Cold (10)")
				end
			end
			if (!character.has_ability("Immunity to Electricity"))
				if (character.get_ability_level("Resistance to Electricity").to_i < 10)
					character.remove_ability("Resistance to Electricity", true)
					character.add_ability("Resistance to Electricity (10)")
				end
			end
			Alertness.add(@character) if Alertness.available?(@character)
			CombatReflexes.add(@character) if CombatReflexes.available?(@character)
			Dodge.add(@character) if Dodge.available?(@character)
			ImprovedInitiative.add(@character) if ImprovedInitiative.available?(@character)
			LightningReflexes.add(@character) if LightningReflexes.available?(@character)
		end
	end

#-- self.is_template ------------------------------------------------------------------------#
#++	
	def self.is_template
		return true
	end
end
RaceList.push(Vampire)