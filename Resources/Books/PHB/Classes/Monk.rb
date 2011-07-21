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
		#[TODO] Add proficiencies
		#Class Features :
		(@character.speed += 10) if (class_level%3 == 0)
		@character.ac_list["monk bonus"] = (class_level/5).floor
		#class abilities
		case class_level
			when 1
				@character.add_ability("Unnarmed Strike")
				@character.add_ability("Flurry of Blows")
				@character.weapon_proficiencies |= ["club", "crossbow (light)", "crossbow(heavy)", "dagger", "handaxe", "javelin", "kama", "nunchaku", 
													"quarterstaff", "sai", "shuriken", "siangham", "sling"]
				@character.armor_proficiencies |= [""]
				#bonus feat [improved grapple, stunning fist]
			when 2
				@character.add_ability("Evasion")
			when 3
				@character.add_ability("Still Mind")
			when 4
				@character.add_ability("Slow Fall (20ft.)")
				@character.add_ability("Ki Strike (Magic)")
			when 5
				@character.add_ability("Purity of Body")
			when 6
			when 7
				@character.add_ability("Wholeness of Body")
			when 8
			when 9
				#@character.remove_ability("Evasion")
				@character.add_ability("Improved Evasion")
			when 10
				@character.remove_ability("Ki Strike (Magic)")
				@character.add_ability("Ki Strike (Magic, Lawful)")
			when 11
				@character.add_ability("Diamond Body")
			when 12
				@character.add_ability("Abundant Step")
			when 13
				@character.add_ability("Diamond Soul")
			when 14
			when 15
				@character.add_ability("Quivering Palm")
			when 16
				@character.remove_ability("Ki Strike (Magic, Lawful)")
				@character.add_ability("Ki Strike (Magic, Lawful, Adamantine)")
			when 17
				@character.add_ability("Timeless Body")
				@character.add_ability("Tongue of the Sun and Moon")
			when 18
			when 19
				@character.add_ability("Empty Body")
			when 20
				@character.add_ability("Perfect Body")
		end
	end
end
ClassList.push(Monk)