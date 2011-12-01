#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class BrewPotion < FeatModel
  @bonus_classes = ["Wizard"]
	def initialize 
		super
		@title = "Brew Potion"
		@description = "You can create a potion of any 3rd-level or lower spell that you know and that targets one or more creatures. Brewing a potion takes one day. When you create a potion, you set the caster level, which must be sufficient to cast the spell in question and no higher than your own level. The base price of a potion is its spell level times its caster level times 50 gp. To brew a potion, you must spend 1/25 of this base price in XP and use up raw materials costing one half this base price.

When you create a potion, you make any choices that you would normally make when casting the spell. Whoever drinks the potion is the target of the spell.

Any potion that stores a spell with a costly material component or an XP cost also carries a commensurate cost. In addition to the costs derived from the base price, you must expend the material component or pay the XP when creating the potion."
		@page = "PHB 89"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level >= 3
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class CraftMagicArmsAndArmor < FeatModel
  @bonus_classes = ["Wizard"]
  
	def initialize 
		super
		@title = "Craft Magic Arms and Armor"
		@description = "You can create any magic weapon, armor, or shield whose prerequisites you meet. Enhancing a weapon, suit of armor, or shield takes one day for each 1,000 gp in the price of its magical features. To enhance a weapon, suit of armor, or shield, you must spend 1/25 of its features' total price in XP and use up raw materials costing one-half of this total price.

The weapon, armor, or shield to be enhanced must be a masterwork item that you provide. Its cost is not included in the above cost.

You can also mend a broken magic weapon, suit of armor, or shield if it is one that you could make. Doing so costs half the XP, half the raw materials, and half the time it would take to craft that item in the first place."
		@page = "PHB 92"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level >= 5
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class CraftRod < FeatModel
  @bonus_classes = ["Wizard"]
	def initialize 
		super
		@title = "Craft Rod"
		@description = "You can create any rod whose prerequisites you meet. Crafting a rod takes one day for each 1,000 gp in its base price. To craft a rod, you must spend 1/25 of its base price in XP and use up raw materials costing one-half of its base price.

Some rods incur extra costs in material components or XP, as noted in their descriptions. These costs are in addition to those derived from the rod's base price."
		@page = "PHB 92"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level >= 9
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class CraftStaff < FeatModel
@bonus_classes = ["Wizard"]
	def initialize 
		super
		@title = "Craft Staff"
		@description = "You can create any staff whose prerequisites you meet.

Crafting a staff takes one day for each 1,000 gp in its base price. To craft a staff, you must spend 1/25 of its base price in XP and use up raw materials costing one-half of its base price. A newly created staff has 50 charges.

Some staffs incur extra costs in material components or XP, as noted in their descriptions. These costs are in addition to those derived from the staff's base price."
		@page = "PHB 92"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level >= 12
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class CraftWand < FeatModel
	@bonus_classes = ["Wizard"]
	def initialize 
		super
		@title = "Craft Wand"

		@description = "You can create a wand of any 4th-level or lower spell that you know. Crafting a wand takes one day for each 1,000 gp in its base price. The base price of a wand is its caster level times the spell level times 750 gp. To craft a wand, you must spend 1/25 of this base price in XP and use up raw materials costing one-half of this base price. A newly created wand has 50 charges.

Any wand that stores a spell with a costly material component or an XP cost also carries a commensurate cost. In addition to the cost derived from the base price, you must expend fifty copies of the material component or pay fifty times the XP cost."
		@page = "PHB 92"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level >= 5
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class CraftWondrousItem < FeatModel
  @bonus_classes = ["Wizard"]
	def initialize 
		super
		@title = "Craft Wondrous Item"
		@description = "You can create any wondrous item whose prerequisites you meet. Enchanting a wondrous item takes one day for each 1,000 gp in its price. To enchant a wondrous item, you must spend 1/25 of the item's price in XP and use up raw materials costing half of this price.

You can also mend a broken wondrous item if it is one that you could make. Doing so costs half the XP, half the raw materials, and half the time it would take to craft that item in the first place.

Some wondrous items incur extra costs in material components or XP, as noted in their descriptions. These costs are in addition to those derived from the item's base price. You must pay such a cost to create an item or to mend a broken one."
		@page = "PHB 92"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level >= 3
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ForgeRing < FeatModel
  @bonus_classes = ["Wizard"]
	def initialize 
		super
		@title = "Forge Ring"
		@description = "You can create any ring whose prerequisites you meet. Crafting a ring takes one day for each 1,000 gp in its base price. To craft a ring, you must spend 1/25 of its base price in XP and use up raw materials costing one-half of its base price.

You can also mend a broken ring if it is one that you could make. Doing so costs half the XP, half the raw materials, and half the time it would take to forge that ring in the first place.

Some magic rings incur extra costs in material components or XP, as noted in their descriptions. You must pay such a cost to forge such a ring or to mend a broken one."
		@page = "PHB 94"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level >= 12
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

class ScribeScroll < FeatModel
  @bonus_classes = ["Wizard"]
	def initialize 
		super
		@title = "Scribe Scroll"
		@description = "You can create a scroll of any spell that you know. Scribing a scroll takes one day for each 1,000 gp in its base price. The base price of a scroll is its spell level times its caster level times 25 gp. To scribe a scroll, you must spend 1/25 of this base price in XP and use up raw materials costing one-half of this base price.

Any scroll that stores a spell with a costly material component or an XP cost also carries a commensurate cost. In addition to the costs derived from the base price, you must expend the material component or pay the XP when scribing the scroll."
		@page = "PHB 99"
		@link = ""
	end
	
	def self.available?(char)
		return !feat_taken(char) && char.caster_level >= 1
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end

FeatList.push(BrewPotion)
FeatList.push(CraftMagicArmsAndArmor)
FeatList.push(CraftRod)
FeatList.push(CraftStaff)
FeatList.push(CraftWand)
FeatList.push(CraftWondrousItem)
FeatList.push(ForgeRing)
FeatList.push(ScribeScroll)