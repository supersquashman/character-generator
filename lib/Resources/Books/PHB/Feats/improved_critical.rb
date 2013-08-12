class ImprovedCritical < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Improved Critical"
		@description = "When using the weapon you selected, your threat range is doubled."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#improvedCritical"
	end
	
	def self.available?(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Improved Critical")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = char.weapon_proficiencies 
    types -= weapons
		return types.length > 0 && char.BAB > 7
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Improved Critical")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = char.weapon_proficiencies 
    types -= weapons
    type = types[rand(types.length)]
    char.feats.last.title = "Improved Critical(" + type + ")"
	end
end
FeatList.push(ImprovedCritical,"PHB")