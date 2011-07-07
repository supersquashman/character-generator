class SkillModel
	attr_accessor :name, :ranks, :description,:mod,:armor_check, :bonus_hash, :restricted, :circumstance_hash
	#bonus_hash should contain reason as key and bonus as value
	#circumstance_hash should contain reason as key and bonus as value
	def initialize (name, mod="wis",armor_check=false, description="",restricted=[],ranks=0)
		@name=name
		@ranks=ranks
		@mod=mod
		@armor_check=armor_check ?  armor_check=="true"? true: false : false 
		@description=description
		@restricted = restricted
		@bonus_hash = Hash.new
		@circumstance_hash = Hash.new
	end
	def ==(skill)
		if(skill.is_a?(SkillModel))
			return self.name == skill.name
		else
			return self.name ==skill
		end
	end
	def bonus(char)
		b = char.stat_mod[@mod]
		return b
	end
end