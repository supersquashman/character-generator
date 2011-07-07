class ClassModel
	attr_accessor :good_save,:bad_save,:good_bab,:mid_bab,:bad_bab
	@@hd = "1d4"
	def self.Class_skills
		Class_skills
	end
	def self.Skill_mul
		2
	end
	
	def self.apply(character)
		character.classes.push(self.new)
	end
	def self.available?(character)
		return true
	end
	
	def self.class_level(char)
		cl=0
		
		char.classes.each do  |cla| 
			if cla!=self.to_s
			cl+=1
			end
		end
		
		return cl
	end
	def self.skill_ranks (char)
		return ( (self.Skill_mul+char.stat_mod["int"]) * (char.classes.length>1? 1:4))
	end
	
	Good_save = [2,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
	Bad_save = [0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0]
	Good_bab = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	Mid_bab =  [0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1]
	Bad_bab =  [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
end