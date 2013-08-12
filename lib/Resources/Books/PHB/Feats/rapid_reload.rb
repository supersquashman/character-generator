class RapidReload < FeatModel
	@bonus_classes = ["Fighter"]
	
	def initialize 
		super
		@title = "Rapid Reload"
		@description = "The time required for you to reload your chosen type of crossbow is reduced to a free action (for a hand or light crossbow)" +
    "or a move action (for a heavy crossbow). Reloading a crossbow still provokes an attack of opportunity."
		@page = "PHB??"
		@link = "http://www.d20srd.org/srd/feats.htm#rapidReload"
	end
	
	def self.available?(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Rapid Reload")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = (char.weapon_proficiencies & ["Hand Crossbow", "Repeating Heavy Crossbow", "Repeating Light Crossbow", "Heavy Crossbow","Light Crossbow"] )- weapons
		return types.size > 0
	end
	
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
  
  def self.add(char)
		super(char)
    weapons = char.feats.collect{|feat| feat.title}.reject{|name| !name.include?("Rapid Reload")}.collect do|name| 
    match = name.match(/(?:\()(.+)(?:\)$)/)
    match ? match[1] : ""
    end.reject{|i| i ==""}
    types = char.weapon_proficiencies & ["Hand Crossbow", "Repeating Heavy Crossbow", "Repeating Light Crossbow", "Heavy Crossbow","Light Crossbow"]
    types -= weapons
    type = types[rand(types.length)]
    char.feats.last.title = "Rapid Reload(" + type + ")"
	end
end
FeatList.push(RapidReload,"PHB")