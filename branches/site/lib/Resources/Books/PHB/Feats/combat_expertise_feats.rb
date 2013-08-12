class CombatExpertise < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Combat Expertise"
		@description = "When you use the attack action or the full attack action in melee, you can take a penalty of as much as -5 on your attack roll and add 
						the same number (+5 or less) as a dodge bonus to your Armor Class. This number may not exceed your base attack bonus. The changes to attack 
						rolls and Armor Class last until your next action."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["int"] >= 13
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ImprovedDisarm < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Combat Expertise"
		@description = "You do not provoke an attack of opportunity when you attempt to disarm an opponent, nor does the opponent have a chance to 
						disarm you. You also gain a +4 bonus on the opposed attack roll you make to disarm your opponent."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["int"] >= 13 && CombatExpertise.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ImprovedFeint < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Combat Expertise"
		@description = "You can make a Bluff check to feint in combat as a move action."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["int"] >= 13 && CombatExpertise.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ImprovedTrip < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Combat Expertise"
		@description = "You do not provoke an attack of opportunity when you attempt to trip an opponent while you are unarmed. You also gain a +4 bonus on your 
						Strength check to trip your opponent.

			If you trip an opponent in melee combat, you immediately get a melee attack against that opponent as if you hadn't used your attack for the trip attempt."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["int"] >= 13 && CombatExpertise.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

FeatList.push(CombatExpertise,"PHB")
FeatList.push(ImprovedDisarm,"PHB")
FeatList.push(ImprovedFeint,"PHB")
FeatList.push(ImprovedTrip,"PHB")