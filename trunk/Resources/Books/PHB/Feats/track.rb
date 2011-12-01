class Track < FeatModel
	@bonus_classes = []
	
	def initialize 
		super
		@title = "Track"
		@description = "To find tracks or to follow them for 1 mile requires a successful Survival check." +
    " You must make another Survival check every time the tracks become difficult to follow."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#track"
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end
FeatList.push(Track)