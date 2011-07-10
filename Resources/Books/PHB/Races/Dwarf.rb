class Dwarf< RaceModel
	def initialize(character)
		super(character)
		@size = "Medium"
		@speed = 20
		@age_roll = Roll.new("7d6+40")
		@favored_classes=["Fighter"]
		character.languages.learn_lang("Dwarven")
		@bonus_languages = ["Giant", "Gnome", "Goblin", "Orc", "Terran", "Undercommon"]
	end
	def self.apply(character)
		super(character)
		if(character.level <=1)
			character.stats["con"] += 2
			character.stats["cha"] -= 2			
			character.skill_list.assign_circ("Appraise","Racial (Stone)", 2)
			character.skill_list.assign_circ("Craft","Racial (Stone)", 2)
			character.skill_list.assign_circ("Search","Stonecunning", 2)
			character.add_ability("Darkvision(60)")
			character.add_ability("Weapon Familiarity (Dwarven Waraxe & Urgrosh)")
			character.add_ability("+4 Ability vs Bull Rush or Trip [Ground]")
			character.add_ability("+2 Saves vs Poision")
			character.add_ability("+2 Saves vs Spells")
			character.add_ability("+1 attack vs orcs and goblins")
			character.add_ability("+4 Dodge(Giant)")
		end
	end
end
RaceList.push(Dwarf)