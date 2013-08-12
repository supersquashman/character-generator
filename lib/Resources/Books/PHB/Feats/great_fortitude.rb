class GreatFortitude < FeatModel
	@bonus_classes = []
	
	def initialize 
		super
		@title = "Great Fortitude"
		@description = "You get a +2 bonus on all Fortitude saving throws."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#greatFortitude"
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    char.fort_save["misc"] +=2
  end
end
FeatList.push(GreatFortitude,"PHB")