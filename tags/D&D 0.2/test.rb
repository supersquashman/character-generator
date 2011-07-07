require_relative "RaceList"

temp = ["phb", "mm1","eberron","forgotten realms","frostburn"]
occurance = Hash.new
list = RaceList.new
books.each { |book| Dir.glob("./**/"+book+"/*.rb").each {|file| require file} }

(1..50).each do |i|
	race = list.get_race(temp)
	if race[1]
		race_name = race[1] + " " + race[0]
		if race[2]
			race_name += " (" + race[2] + ")"
		end
		race = race_name
	end
	if occurance.include?(race)
		occurance[race] = occurance[race].to_s.to_i + (1).to_i
		#puts occurance[race.to_s]
		#puts occurance[race.to_s].to_s.to_i
	else
		occurance[race] = (1).to_s
	end
end

occurance.each do |i|
	puts i
end
#puts race
#mm1 = ["Drow","Orc","Troll","Lizardfolk", "Hill Giant", "Frost Giant", "Cloud Giant", "Fire Giant","Stone Giant", "Storm Giant", "Doppleganger","Eladrin","Gnoll",
#			"Half-Dragon", "Half-Fiend","Kobold","Medusa", "Ogre", "Ogre Mage", "Rakshasa", "Yuanti","Troglodyte", "Lich","Vampire"] 
#puts mm1