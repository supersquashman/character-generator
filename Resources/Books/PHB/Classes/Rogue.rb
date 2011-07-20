# Rogue - D&D class model and container for related information
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

#--== Rogue ============================================================================#
#++
class Rogue < ClassModel

#-- initialize(character) --------------------------------------------------------------#
#++
	def initialize (character)
		super(character)
		@hd_type="1d6"
		@base_skill_num = 8
		@will = BAD_SAVE
		@fort = BAD_SAVE
		@reflex = GOOD_SAVE
		@bab = MID_BAB
		@class_skills = ["Appraise","Balance","Bluff","Climb","Craft",
						"Decipher Script","Diplomacy","Disable Device","Disguise",
						"Escape Artist","Forgery","Gather Information","Hide",
						"Intimidate","Jump","Knowledge(Local)","Listen",
						"Move Silently","Open Lock","Perform", "Profession",
						"Search","Sense Motive", "Sleight of Hand","Spot",
						"Swim","Tumble","Use Magic Device","Use Rope"]
		apply
	end

#-- apply ------------------------------------------------------------------------------#
#++
	def apply
		super
    #[TODO] Add proficiencies
		#Class Features :
		#sneak attack           
		@class_level %2>0 ? @character.increase_ability("Sneak Attack",1,"d6") : 0
		#trap sense
		if [3,6,9,12,15,18].include?(class_level)
			@character.increase_ability("Trap Sense")
			#AC dodge bonus against traps?
		end

		#class abilities
		case class_level
			when 1
      @character.add_ability("Trapfinding")
      @character.weapon_proficiencies |= [ "Simple", "Hand Crossbow", "Rapier", "Sap", "Shortbow", "Short Sword"]
      @character.armor_proficiencies |= ["Light"]
			when 2 then @character.add_ability("Evasion")
			when 4 then @character.add_ability("Uncanny Dodge") #flat footed ac problem
			when 8 then @character.add_ability("Improved Uncanny Dodge")
			when 10,13,16,19
				#Special Ability
				selected = false
				sp_abilities = ["Crippling Strike", "Defensive Roll","Improved Evasion","Opportunist","Skill Mastery","Slippery Mind","Feat"]
				while !selected 
					spability = sp_abilities[rand(sp_abilities.length)]
					if spability =="Feat"
						FeatList.roll_feats(@character,1)
						selected = true
					elsif spability=="Skill Mastery"
						# randomly select skills that havent been selected
						forbid_skills =[] 
						skills =[]
						@character.abilities.each do |ability|
							if ability.to_s.include? "Skill Mastery"
								forbid_skills.push(ability.scan(/(?:,\s*|\(\s*)(\w+)/).flatten)
							end
						end
						num=0
						if @character.skill_list.skills.length >2
							while num!=3 do
								sel = @character.skill_list.skills[rand(@character.skill_list.skills.length)]
								if !forbid_skills.include?( sel.name ) && !skills.include?(sel.name) 
									skills.push(sel.name)
									num+=1
								end
							end
						else
							skills = ["Hide", "Move Silently","Climb"]
						end 
						skills.each do |skill|
							@character.add_ability(spability+"("+skill+")")
						end
						selected = true
					elsif !@character.abilities.include?(spability) then
						@character.add_ability(spability)
						selected = true
					end
				end
		end
	end
end
ClassList.push(Rogue)