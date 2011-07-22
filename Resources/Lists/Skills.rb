# Skills - List of D&D Skills[SkillModel]
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

require_relative "SkillList"
require_relative "../Models/SkillModel"

#--== Skills ===========================================================================#
#++
class Skills
	def initialize
		SkillList.load_skills( 
		[["Appraise","int"],
		["Balance","dex",true],
		["Bluff","cha"],
		["Climb","str",true,],
		["Concentration","con"],
		#["Craft","int"], #Craft skills added below
		["Decipher Script","int"],
		["Diplomacy","cha"],
		["Disable Device","int"],
		["Disguise","cha"],
		["Escape Artist","dex",true],
		["Forgery","int"],
		["Gather Information","cha"],
		["Handle Animal","cha"],
		["Heal","wis"],
		["Hide","dex",true],
		["Intimidate","cha"],
		["Jump","str",true],
		#["Knowledge","int"], #Knowledge skills added below
		["Listen","wis"],
		["Move Silently","dex",true],
		["Open Lock","dex"],
		#["Perform","cha"], #Perform skills added below
		["Profession","wis"], #[TODO]each profession?
		["Ride","dex"],
		["Search","int"],
		["Sense Motive","wis"],
		["Sleight of Hand","dex",true],
		["Speak Language","none"], #should add language to character
		["Spellcraft","int"],
		["Spot","wis"],
		["Survival","wis"],
		["Swim","str",true], #double armorcheck penalties (Added in to_s method)
		["Tumble","dex",true],
		["Use Magic Device","cha"],
		["Use Rope","dex"]])
	#Knowledge Skills
		knowledge = ["Military","Arcana","Architecture and Engineering","Dungeoneering","Geography","History","Local","Nature","Nobility and Royalty","Psionics","Religion","The Planes"]
		knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
		knowledge.each {|k| SkillList.push(SkillModel.new(k,"int"))}
	#Craft Skills
		craft = ["Alchemy", "Armorsmithing", "Bowmaking", "Trapmaking", "Weaponsmithing", "Carpentry", "Blacksmithing", "Mechanical", "Stoneworking"]
		craft.each_index {|j| craft[j] = "Craft(" + craft[j] +")" }
		craft.each {|c| SkillList.push(SkillModel.new(c,"int"))}
	#Perform Skills
		perform = ["Act", "Comedy", "Dance", "Keyboard", "Oratory", "Percussion", "String", "Wind", "Sing"]
		perform.each_index {|l| perform[l] = "Perform(" + perform[l] +")" }
		perform.each {|p| SkillList.push(SkillModel.new(p,"cha"))}
	#Profession Skills
=begin
		profession = ["Act", "Comedy", "Dance", "Keyboard", "Oratory", "Percussion", "String", "Wind", "Sing"]
		profession.each_index {|m| profession[m] = "Profession(" + profession[m] +")" }
		profession.each {|r| SkillList.push(SkillModel.new(r,"int"))}
=end
		#-------------------------Custom Skill------------------
		#Format for adding new skills:   SkillList.load_skills(name, mod="<stat>",armor_check=<boolean>*, description=""*,restricted=[]*,ranks=0*)   *optional
	end
end