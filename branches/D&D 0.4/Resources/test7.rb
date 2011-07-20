require_relative "Character"
#require_relative "Lists"

temp = ["PHB"]#, "mm1","eberron","forgotten realms","frostburn"]
temp.each { |book| Dir.glob("./**/"+book+"/*Races/*.rb").each {|file| require file} }
temp.each { |book| Dir.glob("./**/"+book+"/*Classes/*.rb").each {|file| require file} }
temp.each { |book| Dir.glob("./**/"+book+"/*Feats/*.rb").each {|file| require file} }


1.times do |i|
panda = Character.new(temp)
panda.max_classes = 1
		
	(rand(20)+1).times do |i|
		panda.level_up
	end
  panda.final_levelup_procs.each{|proc| proc.call panda}

#puts (i+1).to_s + ".) " + panda.classes.to_s
puts "HP:  " + panda.HP.to_s
puts "HD:  " + panda.HD.to_s
puts "Level:  " + panda.level.to_s
puts "Race:  " + panda.race.to_s
puts "Age:  " + panda.age.to_s
puts "Base Attack Bonus:  " + panda.BAB.to_s
puts ""
["str","dex","con","int","wis","cha"].each do |stat|
	if (panda.stat_mod[stat] >= 0)
		puts stat + "	" + panda.stats[stat].to_s + " (+" + panda.stat_mod[stat].to_s + ")"
	else
		puts stat + "	" + panda.stats[stat].to_s + " (" + panda.stat_mod[stat].to_s + ")"
	end
end
puts panda.skill_list
puts ""
puts panda.abilities.sort
puts "\nFavored Classes:  "
panda.race.favored_classes.each {|cls| puts cls}
puts ""
puts panda.languages
puts "Classes:  "
temp_classes = []
panda.classes.each {|cls| temp_classes.push(cls.to_s)}
temp_classes.uniq.each do |cls|
	#puts cls.to_s + "("+ panda.classes.collect {|val| val.class.to_s == cls}.size.to_s + ")"
	puts cls.to_s + "(" + temp_classes.count(cls).to_s + ")"
end
puts ""
sorted_feats = []
panda.feats.each do |feat|
	sorted_feats += [feat.to_s]
end
puts sorted_feats.sort
puts panda.spells.to_s

end