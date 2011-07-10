#require "RaceList"
require 'pathname' 
require Pathname(__FILE__).ascend{|d| h=d+'ClassList.rb'; break h if h.file?} 
class Rogue < ClassModel
	@@hd = "1d6"
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
		
	end
	def self.apply(char)
		level = super(char)
		class_level = level.class_level #for visibility
		#Class Features :
		#sneak attack		
		class_level %2>0 ? char.inc_ability("Sneak Attack",1,"d6") : 0
		#trap sense
		if [3,6,9,12,15,18].include?(class_level)
			char.inc_ability("Trap Sense")
			#AC dodge bonus against traps?
		end

		#class abilities
		case class_level
			when 1 then char.add_ability("Trapfinding")
			when 2 then char.add_ability("Evasion")
			when 4 then char.add_ability("Uncanny Dodge") #flat footed ac problem
			when 8 then char.add_ability("Improved Uncanny Dodge")
			when 10,13,16,19
				#Special Ability
				selected = false
				sp_abilities = ["Crippling Strike", "Defensive Roll","Improved Evasion","Opportunist","Skill Mastery","Slippery Mind","Feat"]
				while !selected 
					spability = sp_abilities[rand(sp_abilities.length)]
					if spability =="Feat"
						# [TODO] add feat to character
						char.add_ability(spability) #replace with random feat method
						selected = true
					elsif spability=="Skill Mastery"
					# randomly select skills that havent been selected
						forbid_skills =[] 
						skills =[]
						char.abilities.each do |ability|
							if ability.to_s.include? "Skill Mastery"
								forbid_skills.push(ability.scan(/(?:,\s*|\(\s*)(\w+)/).flatten)
							end
						end
						num=0
						if char.skill_list.skills.length >2
							while num!=3 do
								sel = char.skill_list.skills[rand(char.skill_list.skills.length)]
								if !forbid_skills.include?( sel.name ) && !skills.include?(sel.name) 
									skills.push(sel.name)
									num+=1
								end
							end
						else
						skills = ["Hide", "Move Silently","Climb"]
						end
						char.add_ability(spability+"("+skills.join(", ")+")")	
						selected = true
					elsif !char.abilities.include?(spability) then
						char.add_ability(spability)
						selected = true
					end
				end
		end
	end
end
ClassList.push(Rogue)