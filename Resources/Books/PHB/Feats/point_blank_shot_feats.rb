class PointBlankShot < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Point Blank Shot"
		@description = "You get a +1 bonus on attack and damage rolls with ranged weapons at ranges of up to 30 feet."
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

class FarShot < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Far Shot"
		@description = "When you use a projectile weapon, such as a bow, its range increment increases by one-half (multiply by 1.5). When you use a thrown weapon, its range increment is doubled."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && PointBlankShot.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class PreciseShot < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Precise Shot"
		@description = "You can shoot or throw ranged weapons at an opponent engaged in melee without taking the standard -4 penalty on your attack roll."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && PointBlankShot.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class RapidShot < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Rapid Shot"
		@description = "You can get one extra attack per round with a ranged weapon. The attack is at your highest base attack bonus, but each attack you make in that "+
						"round (the extra one and the normal ones) takes a -2 penalty. You must use the full attack action to use this feat."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && PointBlankShot.feat_taken(char) && char.stats["dex"] >= 13
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class Manyshot < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Manyshot"
		@description = "As a standard action, you may fire two arrows at a single opponent within 30 feet. Both arrows use the same attack roll (with a -4 penalty) to determine success and deal damage normally (but see Special).

						For every five points of base attack bonus you have above +6, you may add one additional arrow to this attack, to a maximum of four arrows at a base attack bonus of +16. However, each arrow after the second adds a cumulative -2 penalty on the attack roll (for a total penalty of -6 for three arrows and -8 for four).

						Damage reduction and other resistances apply separately against each arrow fired.
						
						Regardless of the number of arrows you fire, you apply precision-based damage only once. If you score a critical hit, only the first arrow fired deals critical damage; all others deal regular damage."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && PointBlankShot.feat_taken(char) && RapidShot.feat_taken(char) && char.stats["dex"] >= 17 && char.BAB >= 6
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ShotOnTheRun < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Shot on the Run"
		@description = "When using the attack action with a ranged weapon, you can move both before and after the attack, provided that your total distance moved is not greater than your speed."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && PointBlankShot.feat_taken(char) && char.stats["dex"] >= 13 && Dodge.feat_taken(char) && Mobility.feat_taken(char) && char.BAB >= 4
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ImprovedPreciseShot < FeatModel
	@@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Improved Precise Shot"
		@description = "Your ranged attacks ignore the AC bonus granted to targets by anything less than total cover, and the miss chance granted to targets by anything less than total concealment. Total cover and total concealment provide their normal benefits against your ranged attacks.

						In addition, when you shoot or throw ranged weapons at a grappling opponent, you automatically strike at the opponent you have chosen."
		@page = "PHB??"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && PointBlankShot.feat_taken(char) && PreciseShot.feat_taken(char) && char.stats["dex"] >= 19 && char.BAB >= 1
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end


FeatList.push(PointBlankShot)
FeatList.push(FarShot)
FeatList.push(PreciseShot)
FeatList.push(ImprovedPreciseShot)
FeatList.push(RapidShot)
FeatList.push(Manyshot)
FeatList.push(ShotOnTheRun)