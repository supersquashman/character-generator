class Toughness < FeatModel
	@bonus_classes = []
	
	def initialize 
		super
		@title = "Toughness"
		@description = "You gain +3 hit points."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#toughness"
	end
	
	def self.available?(char)
		return true
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    char.HP += 3
  end
end
FeatList.push(Toughness,"PHB")