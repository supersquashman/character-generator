require_relative "../Roll"
class ClassModel
	#attr_accessor :good_save,:bad_save,:good_bab,:mid_bab,:bad_bab
	attr_accessor :hd,:hd_type, :class_skills, :char, :will, :reflex, :fort, :bab, :class_level, :base_skill_num
	GOOD_SAVE = [2,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
	BAD_SAVE  = [0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0]
	GOOD_BAB  = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	MID_BAB   = [0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1]
	BAD_BAB   = [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
	def initialize(char)
		@char = char
		@hd_type = "1d4"
		@base_skill_num = 1
		@will = BAD_SAVE
		@reflex = BAD_SAVE
		@fort = BAD_SAVE
		@bab = BAD_BAB
		@class_level = char.classes.collect {|val| val.class == self}.size+1
		@hd = char.classes.length >0 ? Roll.new(hd_type) : Roll.new(hd_type).max
		@class_skills = []
		
	end
	def self.Class_skills
		Class_skills
	end
	
	def self.apply(character)
		#add an instance of this class level to the characters class list
		level = self.new(character)
		character.classes.push(level)
		#roll the hd fro hd_type
		level.hd = character.classes.length >1 ? Roll.new(level.hd_type) : Roll.new(level.hd_type).max
		#apply the classes save bonuses to the character
		character.fort_save["base"] += level.fort[level.class_level-1]
		character.will_save["base"] += level.will[level.class_level-1]
		character.ref_save["base"] += level.reflex[level.class_level-1]
		#apply the bab bonus to the character
		character.BAB += level.bab[level.class_level-1]
		#increase the character's hp by the hit die amount + con bonus
		character.HP += [level.hd.to_i + character.stat_mod["con"],1].max
		#roll this level of the character's skills (4X for first level)
		num_skills = (level.base_skill_num + character.stat_mod["int"])*(level.class_level>1? 1:4)
		character.skill_list.class_skills |= level.class_skills
		character.skill_list.roll_skills(num_skills)
		#descendants will need the class reference for application of the class' abilities
		#[TODO][QUESTION] should the apply class be an instance or class method?
		return level
	end
	def self.available?(character)
		return true
	end
	def to_s
		return self.class.to_s + "( " +hd.to_s+" )"
	end
end