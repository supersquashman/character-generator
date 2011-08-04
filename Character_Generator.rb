require_relative "./Resources/Character"
Dir.glob(File.join(".", "/Resources/Lists", "*.rb")).each do |file|
   require file
end
Dir.glob(File.join(".", "/Resources/Models", "*.rb")).each do |file|
   require file
end
require_relative "Resources/Backgrounds/Background"
require_relative "Resources/Names/Name"

class CharacterGenerator
	@@character_list = []

	def generate_specific_level_characters(char_count = 1, char_level = 1, num_classes = 1, sources = ["PHB"])
		sources.each { |book| Dir.glob("./*Resources/*Books/"+book+"/*Races/*.rb").each {|file| require file} }
		sources.each { |book| Dir.glob("./*Resources/*Books/"+book+"/*Classes/*.rb").each {|file| require file} }
		sources.each { |book| Dir.glob("./*Resources/*Books/"+book+"/*Feats/*.rb").each {|file| require file} }
		sources.each { |book| Dir.glob("./*Resources/*Books/"+book+"/*Items/*.rb").each {|file| require file} }
		
		char_count.times do
			@@character_list.push(Character.new(sources))
		end
		@@character_list.each do |character|
			character.max_classes = num_classes
			char_level.times do
				character.level_up
			end
			character.final_levelup_procs.each{|proc| proc.call character}
		end
	end
	
	def generate_level_range_characters(char_count = 1, char_low_level =1, char_high_level = 20, num_classes = 1, sources = ["PHB"])
	char_count.times do
			@@character_list.push(Character.new(sources))
		end
		@@character_list.times do |character|
			character.max_classes = num_classes
			(rand(char_high_level-char_low_level) + char_low_level).times do
				character.level_up
			end
		end
		character.final_levelup_procs.each{|proc| proc.call character}
	end
	
	def get_characters
	
	end
	
	def save_characters
		@@character_list.each do |character|
			created = false
			new_file_count = 0
			file_name = "Characters/" + character.name.to_s + ".txt"
			while (!created)
				if (File.exists?(file_name))
					new_file_count += 1
					file_name = "Characters/" + character.name.to_s + "(" + new_file_count.to_s + ").txt"
				else
					char_file = File.new(file_name, "w")
					print_character(char_file, character)
					char_file.close
					created = true
				end
			end
		end
	end
	
	def print_character(file, character)
		file.puts "Name:  " + character.name.to_s
		file.puts ""
		["str","dex","con","int","wis","cha"].each do |stat|
			if (character.stat_mod[stat] >= 0)
				file.puts stat + "	" + character.stats[stat].to_s + " (+" + character.stat_mod[stat].to_s + ")"
			else
				file.puts stat + "	" + character.stats[stat].to_s + " (" + character.stat_mod[stat].to_s + ")"
			end
		end
		file.puts ""
		file.puts "Level:  " + character.level.to_s #panda.get_level.to_s
		file.puts "HD:  " + character.HD.to_s
		template_race_list = []
		file.puts "HP:  " + character.HP.to_s
		character.racial_templates.each do |tmplt|
			template_race_list.push(tmplt.to_s)
		end
		file.puts "Gender:  " + character.sex
		file.puts "Race:  " + template_race_list.join(" ").to_s + " " + character.race.to_s
		file.puts "Age:  " + character.age.to_s
		file.puts "Height:  " + ((character.height.to_i/12).floor).to_s + "'" + ((character.height.to_i%12)).to_s + "\""
		file.puts "Weight:  " + character.weight.to_s + " lbs."
		file.puts "Alignment: " + character.alignment
		file.print "Base Attack Bonus:  +" + character.BAB.to_s
		minus = 5
		while (minus < character.BAB)
			file.print "/+" + (character.BAB - minus).to_s
			minus += 5
		end
		file.print "\n"
		file.puts "Base Land Speed:  " + character.speed.to_s + " ft."
		file.print "AC:  " + character.ac_list.values.inject(0){|sum,item| sum.to_i + item.to_i}.to_s + " ("
		separator_counter = 0
		character.ac_list.each do |modifier, bonus|
			separator_counter += 1
			if bonus != 0
				file.print (separator_counter == 1 ? "" : ", ") + modifier.capitalize + ": " +  bonus.to_s + (separator_counter < character.ac_list.length ? "" : ")")
			else
				(separator_counter < character.ac_list.length ? ", " : ")")
				file.print ")" if (separator_counter >= character.ac_list.length)
			end
		end
		file.print "\n"
		(file.puts "Spell Resistance:  " + character.spell_resist.to_s) if character.spell_resist > 0
		file.puts ""
		file.puts "Classes:  "
		temp_classes = []
		character.classes.each {|cls| temp_classes.push(cls.to_s)}
		temp_classes.uniq.each do |cls|
			file.puts cls.to_s + "(" + temp_classes.count(cls).to_s + ")"
		end
		file.print "\nSkills:  \n"
		file.puts character.skill_list
		file.print "\nAbilities:  \n"
		file.puts character.abilities.sort
		#file.puts "\nFavored Classes:  "
		#character.race.favored_classes.each {|cls| file.puts cls}
		file.print "\nLanguages:  \n"
		file.puts character.languages
		file.print "\nFeats:  \n"
		sorted_feats = []
		character.feats.each do |feat|
			sorted_feats += [feat.to_s]
		end
		file.puts sorted_feats.sort
		if character.spells.to_s
			file.puts "\nSpells:"
			file.puts character.spells.to_s
		end
		file.puts "\nBackground:"
		file.puts character.history
		file.puts ""
		file.puts character.primary_motivation
		file.puts ""
		file.puts character.secondary_motivation
	end
end