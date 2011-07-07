# SkillList - Manager of D&D skills[SkillModel], skill generation and container for related methods
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


require_relative "../Models/SkillModel"
require_relative "Skills"

#--== SkillList ========================================================================#
#++
# Class lists available[static] D&D skills, character skills and provides functions for assignment and display

# Members :

# Methods :

class SkillList
	@@list=[] #default skills available
	attr_accessor :skills #skills the character has ranks in or wants to be printed
	attr_accessor :class_skills
	
#-- initialize -------------------------------------------------------------------------#
#++
	def initialize
		@skills=[]
		@class_skills=[]
		#load all skill lists here?
		Skills.new
	end
#-- list -------------------------------------------------------------------------------#
#++
	def list
		return @@list
	end
#-- self.push(skill) -------------------------------------------------------------------#
#++
	#add skills to the skill list
	def self.push(skill)
		@@list.push(skill)
	end
#-- self.list --------------------------------------------------------------------------#
#++
	#return the list of skills available
	def self.list
		return @@list
	end
#-- assign_ranks(name, ranks) ----------------------------------------------------------#
#++
	#give ranks to the skill the character has
	def assign_ranks(name, ranks)
		if skills.include?(name) 
		#increment skill character already has
			skills[skills.index(name)].ranks += ranks
		else if list.include? name 
		#copy base skill from list to character's skills then increment that skill's ranks
			skills.push(list[list.index(name)])
			skills[skills.index(name)].ranks += ranks
		else 
		#skill doesn't exist in database make a new skill only for the character
			skills.push(SkillModel.new(name,""))
			skills[skills.index(name)].ranks += ranks
		end
		end
	end
#-- assign_misc(name, bonus) -----------------------------------------------------------#
#++
	def assign_misc(name, bonus)
		assign_ranks(name,0)
		i = skills.index(name)
		skills[i].bonus_hash["misc"]? skills[i].bonus_hash["misc"] +=bonus : skills[i].bonus_hash["misc"] =bonus
	end
#-- assign_circ(name, bonus) -----------------------------------------------------------#
#++
	def assign_circ(name, type, bonus)
		assign_ranks(name,0)
		i = skills.index(name)
		skills[i].circumstance_hash[type]? skills[i].circumstance_hash[type] +=bonus : skills[i].circumstance_hash[type] =bonus
	end
#-- self.load_skills(array) ------------------------------------------------------------#
#++
	def self.load_skills(array)	
		array.each do |skill|
			#puts "SkillList.push(SkillModel.new('" +skill.join("','")+"'))"
			eval( "SkillList.push(SkillModel.new('" +skill.join("','")+"'))")
		end
	end
#-- roll_skills(ranks, perfered, level, perfer, orig_weight, weight, new) --------------#
#++
	def roll_skills(ranks, perfered=[],level=1,perfer=100, orig_weight=30, weight=5, new=1) 
		ranks = [ranks,1].max 
		points = ranks
		
		skillnum = [(level==1? ranks/4:ranks)+rand(3)+1, ranks/(level+3)].max
		perfernum = 0
		(skillnum).times {rand(weight+perfer+new+orig_weight)<perfer ? perfernum+=1 :0}
		perfernum = [perfernum,perfered.length].min
		orignum=0
		(skillnum-perfernum).times {rand(weight+new+orig_weight)<orig_weight ? orignum+=1 :0}
		orignum = [orignum,skills.length].min
		classnum=0
		(skillnum-orignum-perfernum).times {rand(weight+new)<weight ? classnum+=1 :0}
		classnum = [classnum, class_skills.length].min
		newnum = [skillnum - classnum -orignum , list.length].min
		subset = []
		while subset.length < (classnum+newnum+orignum+perfernum)
			if subset.length < perfernum
				choice =perfered[rand(perfered.length)]
			else if subset.length < orignum+perfernum
				choice =skills[rand(skills.length)].name
			else if subset.length <orignum+classnum+perfernum
				choice =class_skills[rand(class_skills.length)]
			else
				choice =list[rand(list.length)]
			end
			end
			end
			
			if !subset.include?(choice)
				subset.push(choice)
			end
		end

		options=subset
		while points>0 do
			pick = rand(options.length+new)
			if pick <options.length
			skill =options[pick]
			if skills.include?(skill) 
				if skills[skills.index(skill)].ranks < level+3
					assign_ranks(skill,1)
					points+=-1
				else
					options.delete(skill)
				end
			else
				assign_ranks(skill,1)
				points+=-1
			end
			else
				#Speak Language Skill
				#add language
				points+=-1
			end
		end	
	end
#-- to_s(char) -------------------------------------------------------------------------#
#++
	def to_s(char)
		ret =""
		skills.sort! { |a,b| a.name <=> b.name }
		skills.each do |skill|
			bonus = ""
			total=0
			skill.bonus_hash.each do|key,value|
				bonus+= ", "+pm(value)+" "+key
				total+= value
			end
			circ = skill.circumstance_hash.length >0 ? " [" : ""
			skill.circumstance_hash.each { |key, value| circ += pm(value) +" "+key + (skill.circumstance_hash.keys.last !=key ? ", " : "")}
			circ += skill.circumstance_hash.length >0 ? "]" : ""
			total += skill.bonus(char).to_i + skill.ranks.to_i
			#swim = skill.name == "Swim" ? 2 : 1
			#armor = skill.armor_check&&char.armor_check < 0  ? " ["+(char.armor_check*swim).to_s+" Armor Check]" : ""
			#atotal = skill.armor_check&&char.armor_check < 0 ? "["+pm(char.armor_check*swim+total)+"]" : ""
			#ret += skill.name.rjust(40)+" "+(pm(total)+" "+atotal).ljust(9)+" ("+pm(skill.ranks)+" Rank, "+pm(skill.bonus(char).to_i)+ " "+skill.mod.capitalize+bonus+armor+circ+")\n"
			#ret += skill.name.rjust(40) + " " + (pm(total)).ljust(9) + " (" + skill.mod.to_s + ")\n"
			ret += skill.name.rjust(40) + " " + (pm(total)).ljust(9) + " (" + pm(skill.ranks) + " Rank, " + pm(skill.bonus(char).to_i) + " " + skill.mod.capitalize + bonus + circ + ")\n"
		end
		return ret
	end
#-- pm(val) ----------------------------------------------------------------------------#
#++
	def pm(val)
		val>=0 ? "+"+val.to_s: val.to_s
	end
	def total_skills
		total =0
		skills.each {|skill| total+= skill.ranks}
		return total
	end
end