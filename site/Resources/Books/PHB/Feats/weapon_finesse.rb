class WeaponFinesse < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Weapon Finesse"
		@description = "With a light weapon, rapier, whip, or spiked chain made for a creature of your size category," +
    " you may use your Dexterity modifier instead of your Strength modifier on attack rolls. If you carry a shield," +
    " its armor check penalty applies to your attack rolls."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#weaponFinesse"
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.BAB > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    #[TODO] Dex instead of STR
  end
end
FeatList.push(WeaponFinesse)