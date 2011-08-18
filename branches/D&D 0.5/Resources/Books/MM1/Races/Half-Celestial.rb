# Half-Celestial - Model of D&D race and container for related information
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

#--== Half-Celestial ============================================================================#
#++
class HalfCelestial < RaceModel
	attr_accessor :celestial_abilities

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@fly_speed = (character.speed.to_i) > 60 ? 120 : character.speed.to_i * 2
		@breath_DC = 0
		#@racial_HD = (character.race.racial_HD == "0d0") ? character.race.racial_HD : (temp_HD = character.race.racial_HD[character.race.racial_HD.index("d")+1, character.race.racial_HD.length].to_i + 2) < 12 ? temp_HD : 12
		@bite_damage = {"fine" => "1", "diminutive" => "1d2", "tiny" => "1d3", "small" => "1d4", "medium" => "1d6", "large" => "1d8", "huge" => "2d6", "gargantuan" => "3d6", "colossal" => "4d6"}
		@claw_damage = {"diminutive" => "1", "tiny" => "1d2", "small" => "1d3", "medium" => "1d4", "large" => "1d6", "huge" => "1d8", "gargantuan" => "2d6", "colossal" => "3d6"}
		@celestial_abilities = {1 => ["Protection from Evil (3/day)", "Bless (1/day)"], 2 => ["Aid (1/day)", "Detect Evil (1/day)"], 3 => ["Cure Serious Wounds (1/day)", "Neutralize Poison (1/day)"], 
				4 => ["Holy Smite (1/day)", "Remove Disease (1/day)"], 5 => ["Dispel Evil (1/day)"], 6 => ["Holy Word (1/day)"], 
				7 => ["Holy Aura (3/day)", "Hallow (1/day)"], 8 => ["Mass Charm Monster (1/day)"], 9 => ["Summon Monster IX (Celestials only) (1/day)"], 10 => ["Resurrection (1/day)"]}
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
			character.ECL += 4
			#character.HP += Roll.new(@racial_HD).to_i
			character.stats["str"] += 4
			character.stats["dex"] += 2
			character.stats["con"] += 4
			character.stats["int"] += 2
			character.stats["wis"] += 4
			character.stats["cha"] += 4
			character.ac_list["natural"] += 1
			FeatList.roll_feats(character, 2)
			num_skills = (character.stat_mod["int"] + 8) * (character.HD * 3)
			character.skill_list.roll_skills(num_skills)
			if (character.get_ability_level("Darkvision").to_i < 60)
				character.remove_ability("Darkvision", true)
				character.add_ability("Darkvision(60ft.)")
			end
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
			if (!character.has_ability("Immunity to Acid"))
				if (character.get_ability_level("Resistance to Acid").to_i < 10)
					character.remove_ability("Resistance to Acid", true)
					character.add_ability("Resistance to Acid (10)")
				end
			end
			if (!character.has_ability("Immunity to Fire"))
				if (character.get_ability_level("Resistance to Fire").to_i < 10)
					character.remove_ability("Resistance to Fire", true)
					character.add_ability("Resistance to Fire (10)")
				end
			end
			if (character.get_ability_level("Fly").to_i < character.speed)
				character.remove_ability("Fly",true)
				character.add_ability("Fly(#{character.speed}ft.)")
			end
			character.add_ability("Immunity to Disease")
			character.add_ability("Daylight")
			character.add_ability("+4 on Fortitude saves vs. Poison")
			character.final_levelup_procs += [Proc.new {(1..((character.HD/2).floor)).each {|hd| @celestial_abilities[hd].each {|ability| character.add_ability(ability)}}}] if (character.stats["int"] >= 8 || character.stats["dex"] >= 8)
			#character.final_levelup_procs += [Proc.new {(character.HD/2).floor.times {|hd| character.add_ability(@celestial_abilities[hd])}}] if (character.stats["int"] >= 8 || character.stats["dex"] >= 8)
			character.final_levelup_procs += [Proc.new {character.add_ability("Smite Evil (+#{character.HD} damage)")}]
			character.final_levelup_procs += [Proc.new {character.add_ability((character.HD < 12) ? "5/magic" : "10/magic")}]
			character.final_levelup_procs += [Proc.new {character.CR += (character.HD < 6 ? 1 : (character.HD < 11 ? 2 : 3))}]
		end
		character.spell_resist = [(character.HD+1) + 10, 35].min
	end

#-- self.is_template ------------------------------------------------------------------------#
#++	
	def self.is_template
		return true
	end
	
end
RaceList.push(HalfCelestial)