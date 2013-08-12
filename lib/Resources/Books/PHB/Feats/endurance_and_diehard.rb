class Endurance < FeatModel
	@bonus_classes = []
	
	def initialize 
		super
		@title = "Endurance"
		@description = "You gain a +4 bonus on the following checks and saves: Swim checks made to resist nonlethal damage," + 
    " Constitution checks made to continue running, Constitution checks made to avoid nonlethal damage from a forced march," +
    " Constitution checks made to hold your breath, Constitution checks made to avoid nonlethal damage from starvation or thirst," +
    " Fortitude saves made to avoid nonlethal damage from hot or cold environments, and Fortitude saves made to resist damage from suffocation." +
    " Also, you may sleep in light or medium armor without becoming fatigued."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#endurance"
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class Diehard < FeatModel
	@bonus_classes = []
	
	def initialize 
		super
		@title = "Diehard"
		@description = "When reduced to between -1 and -9 hit points, you automatically become stable. You don't have to roll d% to see if you lose 1 hit point each round." + 
    "\nWhen reduced to negative hit points, you may choose to act as if you were disabled, rather than dying." + 
    " You must make this decision as soon as you are reduced to negative hit points (even if it isn't your turn)."+
    " If you do not choose to act as if you were disabled, you immediately fall unconscious." + 
    "\nWhen using this feat, you can take either a single move or standard action each turn, but not both, and you cannot take a full round action." +
    " You can take a move action without further injuring yourself, but if you perform any standard action (or any other action deemed as strenuous," +
    " including some free actions, swift actions, or immediate actions, such as casting a quickened spell) you take 1 point of damage after completing the act." +
    " If you reach -10 hit points, you immediately die."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#diehard"
	end
	
	def self.available?(char)
		return !feat_taken(char) && Endurance.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end
FeatList.push(Diehard,"PHB")
FeatList.push(Endurance,"PHB")