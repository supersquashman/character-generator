class MountedCombat < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Mounted Combat"
		@description = "Once per round when your mount is hit in combat, you may attempt a Ride check (as a reaction) to negate the hit." +
    " The hit is negated if your Ride check result is greater than the opponent's attack roll. " +
    "(Essentially, the Ride check result becomes the mount's Armor Class if it's higher than the mount's regular AC.)"
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#mountedCombat"
	end
	
	def self.available?(char)
  puts char.skill_list.get_ranks("Ride")
		return char.skill_list.get_ranks("Ride") > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class MountedArchery < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Mounted Archery"
		@description = "The penalty you take when using a ranged weapon while mounted is halved: -2 instead of -4 if your mount is taking a double move, and -4 instead of -8 if your mount is running."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#mountedArchery"
	end
	
	def self.available?(char)
		return char.skill_list.get_ranks("Ride") > 0 && MountedCombat.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class RideByAttack < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Ride-By Attack"
		@description = "When you are mounted and use the charge action, you may move and attack as if with a standard charge and then move again (continuing the straight line of the charge). " +
    "Your total movement for the round can't exceed double your mounted speed. You and your mount do not provoke an attack of opportunity from the opponent that you attack."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#rideByAttack"
	end
	
	def self.available?(char)
		return char.skill_list.get_ranks("Ride") > 0 && MountedCombat.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class SpiritedCharge < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "SpiritedCharge"
		@description = "When mounted and using the charge action, you deal double damage with a melee weapon (or triple damage with a lance)."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#spiritedCharge"
	end
	
	def self.available?(char)
		return char.skill_list.get_ranks("Ride") > 0 && MountedCombat.feat_taken(char) && RideByAttack.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class Trample < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Trample"
		@description = "When you attempt to overrun an opponent while mounted, your target may not choose to avoid you. " +
    "Your mount may make one hoof attack against any target you knock down, gaining the standard +4 bonus on attack rolls against prone targets."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#trample"
	end
	
	def self.available?(char)
		return char.skill_list.get_ranks("Ride") > 0 && MountedCombat.feat_taken(char)
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

FeatList.push(MountedCombat)
FeatList.push(MountedArchery)
FeatList.push(RideByAttack)
FeatList.push(SpiritedCharge)
FeatList.push(Trample)