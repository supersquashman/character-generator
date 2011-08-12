# Half-Dragon - Model of D&D race and container for related information
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

#--== Half-Dragon ============================================================================#
#++
class HalfDragon < RaceModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize(character)
		super(character)
		@fly_speed = (character.speed.to_i) > 60 ? 120 : character.speed.to_i * 2
		@breath_DC = 0
		#@racial_HD = (character.race.racial_HD == "0d0") ? character.race.racial_HD : (temp_HD = character.race.racial_HD[character.race.racial_HD.index("d")+1, character.race.racial_HD.length].to_i + 2) < 12 ? temp_HD : 12
		if (character.race.racial_HD == "0d0")
			@racial_HD = character.race.racial_HD
			@breath_DC = (10 + character.stat_mod["con"])
		else
			race_hd = character.race.racial_HD
			temp_HD = race_hd[race_hd.index("d")+1, race_hd.length].to_i + 2
			if (temp_HD > 12)
				@racial_HD = "1d12"
			else
				@racial_HD = "1d"+ temp_HD.to_s
			end
			@breath_DC = (10 + (character.HD/2).floor + character.stat_mod["con"])
		end
		@bite_damage = {"fine" => "1", "diminutive" => "1d2", "tiny" => "1d3", "small" => "1d4", "medium" => "1d6", "large" => "1d8", "huge" => "2d6", "gargantuan" => "3d6", "colossal" => "4d6"}
		@claw_damage = {"diminutive" => "1", "tiny" => "1d2", "small" => "1d3", "medium" => "1d4", "large" => "1d6", "huge" => "1d8", "gargantuan" => "2d6", "colossal" => "3d6"}
		#@dragon_types = ["Red","Blue","White","Black","Green","Gold","Silver","Bronze","Copper","Brass"]
		@dragon_breaths = {"Red" => "30-foot cone of fire", "Black" => "60-foot line of acid", "Blue" => "60-foot line of lightning",
							"Green" => "30-foot cone of corrosive (acid) gas", "White" => "30-foot cone of cold", "Brass" => "60-foot line of fire",
							"Copper" => "60-foot line of acid", "Bronze" => "60-foot line of lightning", "Gold" => "30-foot cone of fire",
							"Silver" => "30-foot cone of cold"}
		@energy_type = {"Red" => "Fire", "Silver" => "Cold", "Brass" => "Fire", "Bronze" => "Electricity", "Copper" => "Acid", "Gold" => "Fire", "Blue" => "Electricity",
						"Green" => "Acid", "Black" => "Acid", "White" => "Cold"}
		@dragon_type = @dragon_breaths.keys[rand(@dragon_breaths.length)].to_s
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
			character.ECL += 3
			character.CR += 2
			character.BAB += 4
			character.HP += Roll.new(@racial_HD).to_i
			character.stats["str"] += 8
			character.stats["cha"] += 2
			character.stats["con"] += 2
			character.stats["int"] += 2
			character.fort_save["racial"] = 5
			character.ref_save["racial"] = 2
			character.will_save["racial"] = 2
			character.ac_list["natural"] += 4
			FeatList.roll_feats(character, 2)
			num_skills = (character.stat_mod["int"] + 6) * (character.HD * 3)
			character.skill_list.roll_skills(num_skills)
			character.remove_ability("Low-Light Vision")
			character.add_ability("Low-Light Vision")
			character.remove_ability("Darkvision(60ft.)")
			character.add_ability("Darkvision(60ft.)")
			character.add_ability("Natural Weapon:  Claw ("+ @claw_damage[character.size.downcase] +")") if (!character.has_ability("Natural Weapon:  Claw"))
			character.add_ability("Natural Weapon:  Bite ("+ @bite_damage[character.size.downcase] +")") if (!character.has_ability("Natural Weapon:  Bite"))
			character.add_ability("Fly ("+ (@fly_speed).to_s + "ft.)") if (["large","huge","gargantuan","colossal"].include?(character.size.downcase) && !character.has_ability("Fly"))
			character.add_ability("Breath Weapon:  " + @dragon_breaths[@dragon_type] + "(6d8); 1/day; DC" + (10 + (character.HD/2).floor + character.stat_mod["con"]).to_s)
			character.add_ability("Immunity to " + @energy_type[@dragon_type])
		end
	end

#-- self.is_template ------------------------------------------------------------------------#
#++	
	def self.is_template
		return true
	end
	
#-- to_s ------------------------------------------------------------------------#
#++	
	def to_s
		name = super + "(" + @dragon_type + ")"
		return name
	end

end
RaceList.push(HalfDragon)