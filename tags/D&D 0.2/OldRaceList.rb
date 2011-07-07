class RaceList
	$phb = ["Human","Elf","Half-Elf","Halfling","Gnome","Half-Orc","Dwarf"]
	$mm1 = ["Drow","Orc","Troll","Lizardfolk", "Hill Giant", "Frost Giant", "Cloud Giant", "Fire Giant","Stone Giant", "Storm Giant", "Doppleganger","Eladrin","Gnoll",
			"Half-Dragon", "Half-Fiend","Kobold","Medusa", "Ogre", "Ogre Mage", "Lycanthrope","Rakshasa", "Yuanti","Troglodyte", "Lich","Vampire"] 
			#slaad, minotaur, lamia, naga, zombie, titan
	$mm2 = []
	$mm3 = ["Death Giant", "Eldritch Giant"]
	$mm4 = []
	$mm5 = []
	$forgotten_realms = ["Avariel", "Half-Drow", "Air Genasi", "Water Genasi", "Earth Genasi", "Fire Genasi", "Aasimar", "Tiefling", "Fey'ri", "Wood Elf"]
	$eberon = ["Human","Elf","Half-Elf","Halfling","Gnome","Half-Orc","Dwarf","Warforged"]
	$races_of_stone = []
	$frostburn = ["Frost Folk", "Neanderthal", "Uldra"]
	$sandstorm = []
	$templates = ["Lich", "Vampire", "Lycanthrope","Half-Dragon", "Half-fiend", "Zombie"]
	$lycanthropes = ["wolf","bear","sheep","tiger","gator"]
	
	def get_race(sources)
		booklist = {"phb"=>$phb,"mm1"=>$mm1,"mm2"=>$mm2,"mm3"=>$mm3,"mm4"=>$mm4,"mm5"=>$mm5,"forgotten realms"=>$forgotten_realms, "eberron"=> $eberon,"ros"=>$races_of_stone, "frostburn"=>$frostburn}
		
		source_list = []
		sources.each do |source|
			source_list += booklist[source]
		end
		
		book = booklist[sources[rand(sources.length)]]
		race = [book[rand(book.length)]]
		if $templates.include?(race[0])
			base_race = race
			while $templates.include?(base_race[0])
				book = booklist[sources[rand(sources.length)]]#booklist[source_list[rand(source_list.length)]]
				base_race = book[rand(book.length)]
			end
			race += [base_race]
			if race[0] == "Lycanthrope"
				race += [("Were"+$lycanthropes[rand($lycanthropes.length-1)])]
			end
		end
		return race
	end
end