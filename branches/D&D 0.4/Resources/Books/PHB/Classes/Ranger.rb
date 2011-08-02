# Ranger - D&D class model and container for related information
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

require_relative "../Magic/Spells/RangerSpells"

#--== Ranger ===========================================================================#
#++
class Ranger < ClassModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize (character)
		super(character)
		@hd_type="1d8"
		@base_skill_num = 6
		@will = BAD_SAVE
		@fort = GOOD_SAVE
		@reflex = GOOD_SAVE
		@bab = GOOD_BAB
		@class_skills = ["Concentraion", "Craft", "Climb", "Handle Animal",
		"Profession", "Jump", "Heal", "Hide", "Ride", "Move Silently", "Search",
		"Spot", "Survival", "Swim", "Listen", "Use Rope"]
		knowledge = ["Nature", "Geography", "Dungeoneering"]
		knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
		@class_skills += knowledge
		@favored_enemies = Hash.new
		@favored_enemy_list = ["Aberration", "Humanoid (reptilian)", "Animal", "Magical beast", "Construct", "Monstrous Humanoid", "Dragon", "Ooze",
								"Elemental", "Outsider (air)", "Fey", "Outsider (chaotic)", "Giant", "Outsider (earth)", "Humanoid (aquatic)", 
								"Outsider (evil)", "Humanoid (dwarf)", "Outsider (fire)", "Humanoid (elf)", "Outsider (good)", "Humanoid (goblinoid)",
								"Outsider (lawful)", "Humanoid (gnoll)", "Outsider (native)", "Humanoid (gnome)", "Outsider (water)", "Humanoid (halfling)",
								"Plant", "Humanoid (human)", "Undead", "Humanoid (orc)", "Vermin"]
		apply
	end

#-- apply ------------------------------------------------------------------------------#
#++
	def apply#(char)
    Ranger.increase_spells(@character, @class_level)
		super

		#class abilities
		if class_level == 1  
			@character.weapon_proficiencies |=  $SIMPLE_WEAPONS | $MARTIAL_WEAPONS
			@character.armor_proficiencies |= $ARMOR_LIGHT  | $SHIELDS
			@character.add_ability("Track")
			@character.add_ability("Wild Empathy")
			add_favored_enemy
			update_favored_enemies
		end
		#favored enemy [1,5,10,15,20]
		case class_level
			when 2 
				combat_style = ["Combat Style(Archery)","Combat Style(Two-Weapon)"][rand(2)]
				@character.add_ability(combat_style)
				if character.abilities.include?("Combat Style(Archery)")
					#archery combat style
					if (!PointBlankShot.feat_taken(@character))
						PointBlankShot.add(@character) 
					else
						FeatList.roll_feats(@character,1)
					end
				else
					#two-weapon combat style
					if (!TwoWeaponFighting.feat_taken(@character))
						TwoWeaponFighting.add(@character)
					else
						FeatList.roll_feats(@character,1)
					end
				end
			when 3 
			#endurance
			when 4
				@character.add_ability("Animal Companion")
				@character.caster_level +=2
			when 5
				add_favored_enemy
				increase_favored_enemy_bonus
				update_favored_enemies
			when 6 
				@character.caster_level +=1
				#improved comat style
				if character.abilities.include?("Combat Style(Archery)")
					#archery combat style
					if (!Manyshot.feat_taken(@character))
						Manyshot.add(@character) 
					else
						FeatList.roll_feats(@character,1)
					end
				else
					#two-weapon combat style
					if (!ImprovedTwoWeaponFighting.feat_taken(@character))
						ImprovedTwoWeaponFighting.add(@character)
					else
						FeatList.roll_feats(@character,1)
					end
				end
			when 7 then @character.add_ability("Woodland Stride")
			when 8
				@character.add_ability("Swift Tracker")
				@character.caster_level +=1
			when 9 then @character.add_ability("Evasion")
			when 10
				@character.caster_level +=1
				add_favored_enemy
				increase_favored_enemy_bonus
				update_favored_enemies
			when 11 
			#comat style mastery
			if character.abilities.include?("Combat Style(Archery)")
				#archery combat style
				if (!ImprovedPreciseShot.feat_taken(@character))
					ImprovedPreciseShot.add(@character) 
				else
					FeatList.roll_feats(@character,1)
				end
			else
				#two-weapon combat style
				if (!GreaterTwoWeaponFighting.feat_taken(@character))
					GreaterTwoWeaponFighting.add(@character)
				else
					FeatList.roll_feats(@character,1)
				end
			end
			when 12 then @character.caster_level +=1
			when 13 then @character.add_ability("Camouflage")
			when 14 then @character.caster_level +=1
			when 15
				add_favored_enemy
				increase_favored_enemy_bonus
				update_favored_enemies
			when 16 then @character.caster_level +=1
			when 17 then @character.add_ability("Hide in Plain Sight")
			when 18 then @character.caster_level +=1
			when 20 
				@character.caster_level +=1
				add_favored_enemy
				increase_favored_enemy_bonus
				update_favored_enemies
		end
	end

	def self.increase_spells(character, class_level)
		spell_table = [
			[-1, -1, -1, -1],
			[-1, -1, -1, -1],
			[-1, -1, -1, -1],
			[0,  -1, -1, -1],
			[0,  -1, -1, -1],
			[1,  -1, -1, -1],
			[1,  -1, -1, -1],
			[1,  0,  -1, -1],
			[1,  0,  -1, -1],
			[1,  1,  -1, -1],
			[1,  1,  0,  -1],
			[1,  1,  1,  -1],
			[1,  1,  1,  -1],
			[2,  1,  1,  0 ],
			[2,  1,  1,  1 ],
			[2,  2,  1,  1 ],
			[2,  2,  2,  1 ],
			[3,  2,  2,  1 ],
			[3,  3,  3,  2 ],
			[3,  3,  3,  3 ]]
		SpellList.table_row(spell_table,class_level - 1) do |val,i|
			if character.stats["wis"] >= i+10
				character.spells.roll_spells(val + SpellList.bonus_spells(character.stat_mod["wis"], i+1),(i+1).to_s,"Ranger", true) if val >= 0 
			end
		end
	end
	
	def add_favored_enemy
		#new_favored_enemy = @favored_enemy_list[rand(@favored_enemy_list.length)]
		begin 
			new_favored_enemy = @favored_enemy_list[rand(@favored_enemy_list.length)]
		end while @favored_enemies.keys.include?(new_favored_enemy)
		@favored_enemies[new_favored_enemy] = 2
	end
	
	def increase_favored_enemy_bonus
		@favored_enemies[@favored_enemies.keys[rand(@favored_enemies.keys.length)].to_s] += 2
	end
	
	def update_favored_enemies
		@favored_enemies.each do |enemy, bonus|
			@character.remove_ability("Favored Enemy (" + enemy + " +", true) if @character.has_ability("Favored Enemy (" + enemy + " +")
			@character.add_ability("Favored Enemy (" + enemy + " +" + bonus.to_s + ")")
		end
	end
end
ClassList.push(Ranger)