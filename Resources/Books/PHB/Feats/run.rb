class Run < FeatModel
	
	def initialize 
		super
		@title = "Run"
		@description = "When running, you move five times your normal speed (if wearing medium, light, or no armor and carrying no more than a medium load) or four "+
		"times your speed (if wearing heavy armor or carrying a heavy load). If you make a jump after a running start (see the Jump skill description), you gain a +4 bonus on your "+
		"Jump check. While running, you retain your Dexterity bonus to AC."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @@bonus_classes.include?(class_type)
	end
end

FeatList.push(Run)