require_relative "../Models/SkillModel"
require_relative "Skills"

class SkillList
	@@list=[] #default skills available
	attr_accessor :skills #skills the character has ranks in or wants to be printed
	attr_accessor :class_skills
	def initialize
		@skills=[]
		@class_skills=[]
		#load all skill lists here?
		Skills.new
	end
	def list
		return @@list
	end
	#add skills to the skill list
	def self.push(skill)
		@@list.push(skill)
	end
	#return the list of skills available
	def self.list
		return @@list
	end
	#give ranks to the skill the character has
	def assign_ranks(name, ranks)
		if skills.include?(name) 
			skills[skills.index(name)].ranks += ranks
		else if list.include? name
			skills.push(list[list.index(name)])
			skills[skills.index(name)].ranks += ranks
		else 
			skills.push(SkillModel.new(name,""))
			skills[skills.index(name)].ranks += ranks
		end
		end
	end
	def assign_misc(name, bonus)
		assign_ranks(name,0)
		i = skills.index(name)
		skills[i].bonus_hash["misc"]? skills[i].bonus_hash["misc"] +=bonus : skills[i].bonus_hash["misc"] =bonus
	end
	def assign_circ(name, type, bonus)
		assign_ranks(name,0)
		i = skills.index(name)
		skills[i].circumstance_hash[type]? skills[i].circumstance_hash[type] +=bonus : skills[i].circumstance_hash[type] =bonus
	end
	
	def self.load_skills(array)	
		array.each do |skill|
			#puts "SkillList.push(SkillModel.new('" +skill.join("','")+"'))"
			eval( "SkillList.push(SkillModel.new('" +skill.join("','")+"'))")
		end
	end
	
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
	def pm(val)
		val>=0 ? "+"+val.to_s: val.to_s
	end
	def total_skills
		total =0
		skills.each {|skill| total+= skill.ranks}
		return total
	end
end