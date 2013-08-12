class SkillFocus < FeatModel
	@bonus_classes = []
	
	def initialize 
		super
		@title = "Skill Focus"
		@description = "You get a +3 bonus on all checks involving that skill."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#skillFocus"
	end
	
	def self.available?(char)
    focuses = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Skill Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = char.skill_list.skills.reject{|s| s.ranks.to_i < 1}.collect{|s| s.name}
    types -= focuses
		return types.length > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    focuses = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Skill Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = char.skill_list.skills.reject{|s| s.ranks.to_i < 1}.collect{|s| s.name}
    types -= focuses
    type = types[rand(types.length)]
    char.skill_list.assign_misc(type, 3)
    char.feats.last.title = "Skill Focus(" + type + ")"
	end
end
FeatList.push(SkillFocus,"PHB")