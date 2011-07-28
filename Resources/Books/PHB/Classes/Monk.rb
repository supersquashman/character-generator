# Monk - D&D class model and container for related information
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

#--== Monk ============================================================================#
#++
class Monk < ClassModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize (character)
		super(character)
		@hd_type="1d8"
		@base_skill_num = 4
		@will = GOOD_SAVE
		@fort = GOOD_SAVE
		@reflex = GOOD_SAVE
		@bab = MID_BAB
		@class_skills = ["Balance", "Climb", "Concentration", "Craft", "Diplomacy", "Escape Artist", "Hide", "Jump", "Knowledge (arcana)", 
						"Knowledge (religion)", "Listen", "Move Silently", "Perform", "Profession", "Sense Motive", "Spot", "Swim", "Tumble"]
		@character.ac_list["wis"] = character.stat_mod["wis"]
		apply
	end

#-- apply ------------------------------------------------------------------------------#
#++
	def apply
		super
		#Class Features :
		(@character.speed += 10) if (class_level%3 == 0)
		@character.ac_list["monk bonus"] = (class_level/5).floor
		#class abilities
		case class_level
			when 1
				@character.add_ability("Unnarmed Strike")
				@character.add_ability("Flurry of Blows")
				@character.weapon_proficiencies |= ["Club", "Light Crossbow", "Heavy Crossbow", "Dagger", "Handaxe", "Javelin", "Kama", "Nunchaku", 
													"Quarterstaff", "Sai", "Shuriken", "Siangham", "Sling"]
				@character.armor_proficiencies |= [""]
				FeatList.list[["StunningFist", "ImprovedGrapple"][rand(2)]].add(@character)
			when 2
				FeatList.list[["CombatReflexes", "DeflectArrows"][rand(2)]].add(@character)
				@character.add_ability("Evasion")
			when 3
				@character.add_ability("Still Mind")
			when 4
				@character.add_ability("Slow Fall (20ft.)")
				@character.add_ability("Ki Strike (Magic)")
			when 5
				@character.add_ability("Purity of Body")
			when 6
				#FeatList.list[["ImprovedDisarm", "ImprovedTrip"][rand(2)]].add(@character)
				@character.remove_ability("Slow Fall (20ft.)")
				@character.add_ability("Slow Fall (30ft.)")
			when 7
				@character.add_ability("Wholeness of Body")
			when 8
				@character.remove_ability("Slow Fall (30ft.)")
				@character.add_ability("Slow Fall (40ft.)")
			when 9
				@character.remove_ability("Evasion")
				@character.add_ability("Improved Evasion")
			when 10
				@character.remove_ability("Ki Strike (Magic)")
				@character.add_ability("Ki Strike (Magic, Lawful)")
				@character.remove_ability("Slow Fall (40ft.)")
				@character.add_ability("Slow Fall (50ft.)")
			when 11
				@character.add_ability("Diamond Body")
			when 12
				@character.add_ability("Abundant Step")
				@character.remove_ability("Slow Fall (50ft.)")
				@character.add_ability("Slow Fall (60ft.)")
			when 13
				@character.add_ability("Diamond Soul")
			when 14
				@character.remove_ability("Slow Fall (60ft.)")
				@character.add_ability("Slow Fall (70ft.)")
			when 15
				@character.add_ability("Quivering Palm")
			when 16
				@character.remove_ability("Ki Strike (Magic, Lawful)")
				@character.add_ability("Ki Strike (Magic, Lawful, Adamantine)")
				@character.remove_ability("Slow Fall (70ft.)")
				@character.add_ability("Slow Fall (80ft.)")
			when 17
				@character.add_ability("Timeless Body")
				@character.add_ability("Tongue of the Sun and Moon")
			when 18
				@character.remove_ability("Slow Fall (80ft.)")
				@character.add_ability("Slow Fall (90ft.)")
			when 19
				@character.add_ability("Empty Body")
			when 20
				@character.add_ability("Perfect Body")
				@character.remove_ability("Slow Fall (90ft.)")
				@character.add_ability("Slow Fall (Any Distance)")
		end
	end
end
ClassList.push(Monk)