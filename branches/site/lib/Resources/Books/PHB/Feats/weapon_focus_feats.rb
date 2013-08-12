class WeaponFocus < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Weapon Focus"
		@description = "You gain a +1 bonus on all attack rolls you make using the selected weapon."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#weaponFocus"
	end
	
	def self.available?(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = char.weapon_proficiencies + ["Unarmed Attack" , "Grapple"]
    types += ["Ray"] if char.caster_level > 0
    types -= weapons
		return types.length > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = char.weapon_proficiencies + ["Unarmed Attack" , "Grapple"]
    types += ["Ray"] if char.caster_level > 0
    types -= weapons
    type = types[rand(types.length)]
    char.feats.last.title = "Weapon Focus(" + type + ")"
	end
end

class GreaterWeaponFocus < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Greater Weapon Focus"
		@description = "You gain a +1 bonus on all attack rolls you make using the selected weapon. This bonus stacks with other bonuses on attack rolls, including the one from Weapon Focus."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#greaterWeaponFocus"
	end
	
	def self.available?(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    gweapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Greater Weapon Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    weapons -= gweapons
    fighter_level = char.classes.reject {|val| val.class != Fighter}.size+1
		return weapons.length > 0 && fighter_level > 7
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    gweapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Greater Weapon Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    weapons -= gweapons
    type = weapons[rand(weapons.length)]
    char.feats.last.title = "Greater Weapon Focus(" + type + ")"
	end
end

class WeaponSpecialization < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Weapon Specialization"
		@description = "You gain a +2 bonus on all damage rolls you make using the selected weapon."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#weaponSpecialization"
	end
	
	def self.available?(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    gweapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Specialization")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    weapons -= gweapons
    fighter_level = char.classes.reject {|val| val.class != Fighter}.size+1
		return weapons.length > 0 && fighter_level > 3
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Focus")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    gweapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Specialization")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    weapons -= gweapons
    type = weapons[rand(weapons.length)]
    char.feats.last.title = "Weapon Specialization(" + type + ")"
	end
end

class GreaterWeaponSpecialization < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Greater Weapon Specialization"
		@description = "You gain a +2 bonus on all damage rolls you make using the selected weapon. This bonus stacks with other bonuses on damage rolls, including the one from Weapon Specialization."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#greaterWeaponSpecialization"
	end
	
	def self.available?(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Specialization")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    gweapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Greater Weapon Specialization")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    weapons -= gweapons
    fighter_level = char.classes.reject {|val| val.class != Fighter}.size+1
		return weapons.length > 0 && fighter_level > 11
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Weapon Specialization")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    gweapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Greater Weapon Specialization")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    weapons -= gweapons
    type = weapons[rand(weapons.length)]
    char.feats.last.title = "Greater Weapon Specialization(" + type + ")"
	end
end

FeatList.push(WeaponFocus,"PHB")
FeatList.push(GreaterWeaponFocus,"PHB")
FeatList.push(WeaponSpecialization,"PHB")
FeatList.push(GreaterWeaponSpecialization,"PHB")