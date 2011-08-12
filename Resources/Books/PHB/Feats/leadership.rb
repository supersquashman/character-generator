class Leadership < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Leadership"
		@bonus_classes = []
		@description = "Having this feat enables the character to attract loyal companions and devoted followers, subordinates who assist her. "
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#leadership"
	end
  def self.available?(char)
		return !feat_taken(char) && char.level > 5
	end
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

FeatList.push(Leadership)