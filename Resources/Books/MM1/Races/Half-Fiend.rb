# Half-Fiend - Model of D&D race and container for related information
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

#--== Half-Fiend ============================================================================#
#++
class HalfFiend < RaceModel
	attr_accessor :fiend_abilities

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@fly_speed = (character.speed.to_i) > 60 ? 120 : character.speed.to_i * 2
		@breath_DC = 0
		#@racial_HD = (character.race.racial_HD == "0d0") ? character.race.racial_HD : (temp_HD = character.race.racial_HD[character.race.racial_HD.index("d")+1, character.race.racial_HD.length].to_i + 2) < 12 ? temp_HD : 12
		@bite_damage = {"fine" => "1", "diminutive" => "1d2", "tiny" => "1d3", "small" => "1d4", "medium" => "1d6", "large" => "1d8", "huge" => "2d6", "gargantuan" => "3d6", "colossal" => "4d6"}
		@claw_damage = {"diminutive" => "1", "tiny" => "1d2", "small" => "1d3", "medium" => "1d4", "large" => "1d6", "huge" => "1d8", "gargantuan" => "2d6", "colossal" => "3d6"}
		@fiend_abilities = {1 => ["Darkness (3/day)"], 2 => ["Desecrate (1/day)"], 3 => ["Unholy Blight (1/day)"], 4 => ["Poison (3/day)"], 5 => ["Contagion (1/day)"], 6 => ["Blasphemy (1/day)"], 
							7 => ["Unholy Aura (3/day)", "Unhallow (1/day)"], 8 => ["Horrid Wilting (1/day)"], 9 => ["Summon Monster IX (fiends only) (1/day)"], 10 => ["Destruction (1/day)"]}
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
			character.stats["dex"] += 4
			character.stats["con"] += 2
			character.stats["int"] += 4
			character.stats["cha"] += 2
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
			if !(character.has_ability("Fly"))
				character.add_ability("Fly(#{character.speed * 2}ft.)")
			end
			character.add_ability("Immunity to Poison")
			if (character.has_ability("Natural Weapon:  Claw"))
				if (Roll.new(character.get_ability_level("Natural Weapon:  Claw")) < Roll.new(@claw_damage[character.size.downcase]))
					character.remove_ability("Natural Weapon:  Claw", true)
					character.add_ability("Natural Weapon:  Claw (#{@claw_damage[character.size.downcase]})")
				end
			else
				character.add_ability("Natural Weapon:  Claw (#{@claw_damage[character.size.downcase]})")
			end
			if (character.has_ability("Natural Weapon:  Bite")) 
				if (Roll.new(character.get_ability_level("Natural Weapon:  Bite")) < Roll.new(@bite_damage[character.size.downcase]))
					character.remove_ability("Natural Weapon:  Bite", true)
					character.add_ability("Natural Weapon:  Bite ("+ @bite_damage[character.size.downcase] +")")
				end
			else
				character.add_ability("Natural Weapon:  Bite ("+ @bite_damage[character.size.downcase] +")")
			end
			character.final_levelup_procs += [Proc.new {(1..((character.HD/2).floor)).each {|hd| @fiend_abilities[hd].each {|ability| character.add_ability(ability)}}}] if (character.stats["int"] >= 8 || character.stats["dex"] >= 8)
			#character.final_levelup_procs += [Proc.new {(character.HD/2).floor.times {|hd| character.add_ability(@fiend_abilities[hd])}}] if (character.stats["int"] >= 8 || character.stats["dex"] >= 8)
			character.final_levelup_procs += [Proc.new {character.add_ability("Smite Good (+#{character.HD} damage)")}]
			character.final_levelup_procs += [Proc.new {character.add_ability((character.HD < 12) ? "5/magic" : "10/magic")}]
			character.final_levelup_procs += [Proc.new {character.CR += (character.HD < 5 ? 1 : (character.HD < 11 ? 2 : 3))}]
		end
		character.spell_resist = [(character.HD+1) + 10, 35].min
	end

#-- self.is_template ------------------------------------------------------------------------#
#++	
	def self.is_template
		return true
	end
	
end
RaceList.push(HalfFiend)