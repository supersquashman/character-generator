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
	attr_accessor :character
	
#-- initialize(character)---------------------------------------------------------------#
#++
	def initialize (character)
		@character = character
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
		ranks = ranks.to_f
		if !class_skills.include?(name) 
			ranks = ranks/2
		end
		if skills.include?(name) 
		#increment skill character already has
			skills[skills.index(name)].ranks += ranks
		elsif list.include? name 
		#copy base skill from list to character's skills then increment that skill's ranks
			skills.push(list[list.index(name)].dup)
			skills[skills.index(name)].ranks += ranks
		else 
		#skill doesn't exist in database make a new skill only for the character
			skills.push(SkillModel.new(name,""))
			skills[skills.index(name)].ranks += ranks
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
	def roll_skills(ranks, perfered=[],level=1,perfer=100, orig_weight=50, weight=5, new=1) 
		if character
			level = character.get_level
		end
		ranks = [ranks,1].max 
		points = ranks
		
		#randomly pick a subset of skills to assign to (weigh them according to each param)
		skillnum = ([( ranks / (level==1? 4:1)),1].max ) + rand(4)
		perfered.length>0 ? 0 : perfer=0
		skills.length>0 ? 0 : orig_weight=0
		subset=Array.new
		while subset.length < skillnum
			i=rand(weight+perfer+new+orig_weight)+1
			case i
				when 0..orig_weight
					choice =skills[rand(skills.length)].name
				when orig_weight..orig_weight+weight
					choice =class_skills[rand(class_skills.length)]
				when orig_weight+weight..orig_weight+weight+perfer
					choice =perfered[rand(perfered.length)]
				else
					choice =list[rand(list.length)].name
			end	
			if !subset.include?(choice) && choice
				subset.push(choice)
			end
		end
		#randomly assign the ranks between the subset of skills upto the max rank.
		options=subset.dup
		options.each{|o| if !o then puts"UH1?" end}
		while points>0 do
			if options.length >0
				skill =options[rand(options.length)]
			else
				#should rarely happen when skill points come from some place other than characterclass
				#puts "----------error:Out of skills to pick in options --------------" + points.to_s
				skill =list[rand(list.length)].name
			end
			if !skill then puts"UH2?" end
			if skills.include?(skill) 
				assign_ranks(skill,1)
				points+=-1
				if skills[skills.index(skill)].ranks >= level+3
					#puts skill +" maxed (" + skills[skills.index(skill)].ranks.to_s+")"
					options.delete(skill)
				end
			else
				if(skill.downcase == "speak language")
					#[TODO]add a language
					character.languages.roll_lang()
					#puts "Language"
					points+=-1
				else
					assign_ranks(skill,1)
					points+=-1
				end
			end
		end	
	end
#-- to_s -------------------------------------------------------------------------------#
#++
	def to_s
		ret =""
		skills.sort! { |a,b| a.name <=> b.name }
		skills.each do |skill|
				bonus = ""
				total=0
				skill.bonus_hash.each do|key,value|
						bonus+= ", "+get_positive_negative(value)+" "+key
						total+= value
				end
				circ = skill.circumstance_hash.length >0 ? " [" : ""
				skill.circumstance_hash.each { |key, value| circ += get_positive_negative(value) +" "+key + (skill.circumstance_hash.keys.last !=key ? ", " : "")}
				circ += skill.circumstance_hash.length >0 ? "]" : ""
				total += skill.bonus(@character).to_i + skill.ranks
				swim = skill.name == "Swim" ? 2 : 1
				armor = skill.armor_check&&@character.armor_check < 0  ? " ["+(@character.armor_check*swim).to_s+" Armor Check]" : ""
				atotal = skill.armor_check&&@character.armor_check < 0 ? " ["+pm(@character.armor_check*swim+total)+"]" : ""
				ret += skill.name.rjust(40) + " " + (get_positive_negative(total)+atotal).ljust(9) + " (" + get_positive_negative(skill.ranks) + " Rank, " + get_positive_negative(skill.bonus(@character).to_i) + " " + skill.mod.capitalize + bonus + armor + circ + ")\n"
		end
		return ret
	end
#-- get_positive_negative(val) ---------------------------------------------------------#
#++
        def get_positive_negative(val)
                val>=0 ? "+"+sprintf("%g",val): sprintf("%g",val)
        end
	def total_skills
		total =0
		skills.each {|skill| total+= skill.ranks}
		return total
	end
end