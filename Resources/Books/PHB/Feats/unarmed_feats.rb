class ImprovedUnarmedStrike < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Improved Unarmed Strike"
		@description = "You are considered to be armed even when unarmed.  In addition, your unarmed strikes can deal lethal or nonlethal damage, at your option."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class DeflectArrows < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Deflect Arrows"
		@description = "You must have at least one hand free (holding nothing) to use this feat. Once per round when you would normally be hit with a ranged weapon, 
						you may deflect it so that you take no damage from it. You must be aware of the attack and not flat-footed."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 13 && ImprovedUnarmedStrike.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ImprovedGrapple < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Improved Grapple"
		@description = "You do not provoke an attack of opportunity when you make a touch attack to start a grapple. 
						You also gain a +4 bonus on all grapple checks, regardless of whether you started the grapple."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 13 && ImprovedUnarmedStrike.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
	
	def self.add(char)
		super(char)
		char.grapple["misc"] += 4
	end
end

class SnatchArrows < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Snatch Arrows"
		@description = "When using the Deflect Arrows feat you may catch the weapon instead of just deflecting it. Thrown weapons can immediately be thrown " +
						"back at the original attacker (even though it isn't your turn) or kept for later use.  You must have at least one hand free (holding nothing) " +
						"to use this feat."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 15 && ImprovedUnarmedStrike.feat_taken(char) && DeflectArrows.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class StunningFist < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Stunning Fist"
		@description = "You must declare that you are using this feat before you make your attack roll (thus, a failed attack roll ruins the attempt). " +
						"Stunning Fist forces a foe damaged by your unarmed attack to make a Fortitude saving throw (DC 10 + <character level>/2 + <wisdom modifier>), "+
						"in addition to dealing damage normally. A defender who fails this saving throw is stunned for 1 round (until just before your next action). "+
						"A stunned creature drops everything held, can't take actions, takes a -2 penalty to AC, and loses his Dexterity bonus to AC. "+
						"You may attempt a stunning attack once per day for every four levels you have attained (but see Special), and no more than once per round. "+
						"Constructs, oozes, plants, undead, incorporeal creatures, and creatures immune to critical hits cannot be stunned."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 13 && char.stats["wis"] >= 13 && ImprovedUnarmedStrike.feat_taken(char) && char.BAB >= 8
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

FeatList.push(ImprovedUnarmedStrike)
FeatList.push(ImprovedGrapple)
FeatList.push(DeflectArrows)
FeatList.push(StunningFist)
FeatList.push(SnatchArrows)