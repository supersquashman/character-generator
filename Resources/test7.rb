require_relative "Character"
#require_relative "Lists"

temp = ["PHB", "MM1"]#, "mm1","eberron","forgotten realms","frostburn"]
temp.each { |book| Dir.glob("./**/"+book+"/*Races/*.rb").each {|file| require file} }
temp.each { |book| Dir.glob("./**/"+book+"/*Classes/*.rb").each {|file| require file} }
temp.each { |book| Dir.glob("./**/"+book+"/*Feats/*.rb").each {|file| require file} }
temp.each { |book| Dir.glob("./**/"+book+"/*Items/*.rb").each {|file| require file} }
puts "Seed:"
temp = gets.chomp.to_i
temp = Random.new_seed if temp == 0
srand(temp)
puts temp
1.times do |i|
panda = Character.new(temp)
panda.max_classes = 1
		
	(rand(20)+1).times do |i|
		#panda.level_up.each {|p| p.call panda,i}
		panda.level_up
	end
panda.final_levelup
#puts (i+1).to_s + ".) " + panda.classes.to_s
puts "HP:  " + panda.HP.to_s
puts "HD:  " + panda.HD.to_s
puts "Level:  " + panda.level.to_s#panda.get_level.to_s
template_race_list = []
panda.racial_templates.each do |tmplt|
	template_race_list.push(tmplt.to_s)
end
#puts "Templates:  " + template_race_list.join(" ").to_s
puts "Name:  " + panda.name.to_s
puts "Race:  " + template_race_list.join(" ").to_s + " " + panda.race.to_s
puts "Alignment: " + panda.alignment
puts "Age:  " + panda.age.to_s
puts "Gender:  " + panda.sex
=begin
if (panda.sex. == 0)
	puts "Gender:  Male"
elsif (panda.sex == 1)
	puts "Gender:  Female"
else #for Debugging purposes :D 
	puts "Gender:  WRONG!"
end
=end
puts "Height:  " + ((panda.height.to_i/12).floor).to_s + "'" + ((panda.height.to_i%12)).to_s + "\""
puts "Weight:  " + panda.weight.to_s + " lbs."
puts "Base Attack Bonus:  " + panda.BAB.to_s
puts "Base Land Speed:  " + panda.speed.to_s
puts "AC:  " + panda.ac_list.values.inject(0){|sum,item| sum.to_i + item.to_i}.to_s
(puts "Spell Resistance:  " + panda.spell_resist.to_s) if panda.spell_resist > 0
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
#puts "\nFavored Classes:  "
#panda.race.favored_classes.each {|cls| puts cls}
puts ""
puts "Languages:"
puts panda.languages
puts "Classes:  "
temp_classes = []
panda.classes.each {|cls| temp_classes.push(cls.to_s)}
temp_classes.uniq.each do |cls|
	#puts cls.to_s + "("+ panda.classes.collect {|val| val.class.to_s == cls}.size.to_s + ")"
	puts cls.to_s + "(" + temp_classes.count(cls).to_s + ")"
end
puts ""
puts "Feats:"
sorted_feats = []
panda.feats.each do |feat|
	sorted_feats += [feat.to_s]
end
puts sorted_feats.sort
if panda.spells.to_s
	puts "\nSpells:"
	puts panda.spells.to_s
end
puts "\nBackground:"
puts panda.history
puts ""
puts panda.primary_motivation
puts ""
puts panda.secondary_motivation
#puts panda.stats["str"].to_s + " " +panda.stats["dex"].to_s  + " " + panda.stats["con"].to_s  + " " + panda.stats["int"].to_s  + " " + panda.stats["wis"].to_s  + " " + panda.stats["cha"].to_s 
panda.instance_variables.each do |var|
puts var.to_s + " " + panda.instance_variable_get(var).to_s

end
end