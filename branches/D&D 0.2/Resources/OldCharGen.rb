class CharacterGen2

source_selector = {php_races[] => "php", mm1[] => "mm1", mm2[] => "mm2", mm3[] => "mm3"}

php_races[] = ["Human", "Elf", "Dwarf", "Halfing", "Half-Elf", "Half-Orc"][]
forgotten_realms_races[] = ["Fey'ri", "Air Genasi", "Water Genasi", "Earth Genasi", "Water Genasi", "Tiefling", "Aasimar", "Svirfneblin"] + fr_evles[] + fr_dwarves[]]
eberon_races = ["Warforged"]
other_races = ["Goliath", "Half-Giant", "Xeph", "Dromite", "Thri-Kreen"]

fr_elves[] = ["Avariel", "Sea-Elf", "Moon Elf", "Wood Elf", "Grey Elf", "Wild Elf", "High Elf", "Sun Elf"]
fr_dwarves[] = ["Gold Dwarves", "Deep Dwarves", "Duergar"]

#[str,dex,con,int,wis,cha]
racial_mods = {[0,0,0,0,0,0] => "Human", [0,2,-2,0,0,0] => "Elf", [0,0,2,0,0,-2] => "Dwarf", [] => "Halfling", [0,0,0,0,0,0] => "Half-elf", [] => "Half-orc", 
				[0,2,-2,2,0,2] => "Drow", [] => "Fey'ri", [0,0,0,0,2,2] => "Aasimar",
				[0,2,0,2,-2,-2] => "Air Genasi", [2,0,2,0,-2,-2] => "Earth Genasi", [0,0,0,2,0,-2] => "Fire Genasi", [0,0,2,0,0,-2] => "Water Genasi", 
				[0,2,0,2,0,-2] => "Tiefling", [] => "Thri-Kreen", [] => "Warforged", [0,2,-2,0,0,0] => "High Elf", [] => "Sun Elf", 
				[] => "Avariel", [0,2,0,-2,0,0] => "Sea-Elf",
				[] => "Moon Elf", [2,0,0,-2,0,0] => "Wood Elf", [-2,0,0,2,0,0] => "Grey Elf", [0,2,0,-2,0,0] => "Wild Elf", [0,0,2,0,0,-4] => "Duergar"
				[0,-2,2,0,0,0] => "Gold Dwarves", [0,0,2,0,0,-2] => "Deep Dwarves", [-2,2,-2,0,2,-4] => "Svirfneblin"}

monster_mods = {}

mm1[] = []
mm2[] = []
mm3[] = []

end