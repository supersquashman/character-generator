class ImprovedTurning < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Improved Turning"
		@description = "You turn or rebuke creatures as if you were one level higher than you are in the class that grants you the ability."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#improvedTurning"
	end
	
	def self.available?(char)
		return !feat_taken(char) && ( char.abilities.select{|i| i.include?("Turn")}.size > 0 || char.abilities.select{|i| i.include?("Rebuke")}.size )
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ExtraTurning < FeatModel
  @bonus_classes = []
	def initialize 
		super
		@title = "Extra Turning"
		@description = "Each time you take this feat, you can use your ability to turn or rebuke creatures four more times per day than normal.

If you have the ability to turn or rebuke more than one kind of creature each of your turning or rebuking abilities gains four additional uses per day."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#extraTurning"
	end
	
	def self.available?(char)
		return !feat_taken(char) && ( char.abilities.select{|i| i.include?("Turn")}.size > 0 || char.abilities.select{|i| i.include?("Rebuke")}.size )
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

FeatList.push(ImprovedTurning)
FeatList.push(ExtraTurning)