require_relative "Character"
require_relative "Lists"

temp = ["PHB"]#, "mm1","eberron","forgotten realms","frostburn"]
temp.each { |book| Dir.glob("./**/"+book+"/*Races/*.rb").each {|file| require file} }
temp.each { |book| Dir.glob("./**/"+book+"/*Classes/*.rb").each {|file| require file} }


1.times do |i|
panda = Character.new(temp)
		
	(rand(20)+1).times do |i|
		panda.level_up.each {|p| p.call panda,i}
	end

puts (i+1).to_s + ".) " + panda.classes.to_s
["str","dex","con","int","wis","cha"].each do |stat|
	if (panda.stat_mod[stat] >= 0)
		puts stat + "	" + panda.stats[stat].to_s + " (+" + panda.stat_mod[stat].to_s + ")"
	else
		puts stat + "	" + panda.stats[stat].to_s + " (" + panda.stat_mod[stat].to_s + ")"
	end
end
puts panda.skill_list.to_s(panda)
#puts panda.stats["str"].to_s + " " + panda.stats["dex"].to_s  + " " + panda.stats["con"].to_s  + " " + panda.stats["int"].to_s  + " " + panda.stats["wis"].to_s  + " " + panda.stats["cha"].to_s 
end