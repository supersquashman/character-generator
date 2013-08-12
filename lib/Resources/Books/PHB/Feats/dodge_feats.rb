class Dodge < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Dodge"
		@description = "During your action, you designate an opponent and receive a +1 dodge bonus to Armor Class against attacks from that opponent. You can select a new opponent on any action.

			A condition that makes you lose your Dexterity bonus to Armor Class (if any) also makes you lose dodge bonuses. Also, dodge bonuses stack with each other, unlike most other types of bonuses."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 13
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class Mobility < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Mobility"
		@description = "You get a +4 dodge bonus to Armor Class against attacks of opportunity caused when you move out of or within a threatened area. A condition that makes you lose your Dexterity bonus to Armor Class (if any) also makes you lose dodge bonuses.

			Dodge bonuses stack with each other, unlike most types of bonuses."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 13 && Dodge.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class SpringAttack < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Spring Attack"
		@description = "When using the attack action with a melee weapon, you can move both before and after the attack, provided that your total distance "+
						"moved is not greater than your speed. Moving in this way does not provoke an attack of opportunity from the defender you attack, though it "+
						"might provoke attacks of opportunity from other creatures, if appropriate. You can't use this feat if you are wearing heavy armor.

			You must move at least 5 feet both before and after you make your attack in order to utilize the benefits of Spring Attack."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.stats["dex"] >= 13 && Dodge.feat_taken(char) && Mobility.feat_taken(char) && char.BAB >= 4
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end


FeatList.push(Dodge,"PHB")
FeatList.push(Mobility,"PHB")
FeatList.push(SpringAttack,"PHB")