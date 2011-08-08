class ImprovedInitiative < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Improved Initiative"
		@description = "You get a +4 bonus on initiative checks."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#improvedInitiative"
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    char.initiative +=4
  end
end
FeatList.push(ImprovedInitiative)