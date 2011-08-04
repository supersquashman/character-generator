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

	def generate_specific_level_characters(char_level = 1, book_list = ["PHB"], char_count = 1)
		book_list.each { |book| Dir.glob("./*Resources/*Books/"+book+"/*Races/*.rb").each {|file| require file} }
		book_list.each { |book| Dir.glob("./*Resources/*Books/"+book+"/*Classes/*.rb").each {|file| require file} }
		book_list.each { |book| Dir.glob("./*Resources/*Books/"+book+"/*Feats/*.rb").each {|file| require file} }
		book_list.each { |book| Dir.glob("./*Resources/*Books/"+book+"/*Items/*.rb").each {|file| require file} }
		
		char_count.times do
			@@character_list.push(Character.new(book_list))
		end
		@@character_list.each do |character|
			character.max_classes = 1
			char_level.times do
				character.level_up
			end
			character.final_levelup_procs.each{|proc| proc.call character}
		end
	end
	
	def generate_level_range_characters(char_low_level =1, char_high_level = 20, book_list = ["PHB"], char_count = 1)
	char_count.times do
			@@character_list.push(Character.new(book_list))
		end
		@@character_list.times do |character|
			character.max_classes = 1
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
					print_character(char_file)
					char_file.close
					created = true
				end
			end
		end
	end
	
	def print_character(file)
		file.puts "Name:  " + panda.name.to_s
		file.puts "Race:  " + template_race_list.join(" ").to_s + " " + panda.race.to_s
		file.puts "Alignment: " + panda.alignment
		file.puts "Age:  " + panda.age.to_s
		file.puts "Gender:  " + panda.sex
		file.puts "Height:  " + ((panda.height.to_i/12).floor).to_s + "'" + ((panda.height.to_i%12)).to_s + "\""
		file.puts "Weight:  " + panda.weight.to_s + " lbs."
		file.puts "Base Attack Bonus:  " + panda.BAB.to_s
		file.puts "Base Land Speed:  " + panda.speed.to_s
		file.puts "AC:  " + panda.ac_list.values.inject(0){|sum,item| sum.to_i + item.to_i}.to_s
		(file.puts "Spell Resistance:  " + panda.spell_resist.to_s) if panda.spell_resist > 0
		file.puts ""
		["str","dex","con","int","wis","cha"].each do |stat|
			if (panda.stat_mod[stat] >= 0)
				file.puts stat + "	" + panda.stats[stat].to_s + " (+" + panda.stat_mod[stat].to_s + ")"
			else
				file.puts stat + "	" + panda.stats[stat].to_s + " (" + panda.stat_mod[stat].to_s + ")"
			end
		end
		file.puts panda.skill_list
		file.puts ""
		file.puts panda.abilities.sort
		#file.puts "\nFavored Classes:  "
		#panda.race.favored_classes.each {|cls| file.puts cls}
		file.puts ""
		file.puts "Languages:"
		file.puts panda.languages
		file.puts "Classes:  "
		temp_classes = []
		panda.classes.each {|cls| temp_classes.push(cls.to_s)}
		temp_classes.uniq.each do |cls|
			#file.puts cls.to_s + "("+ panda.classes.collect {|val| val.class.to_s == cls}.size.to_s + ")"
			file.puts cls.to_s + "(" + temp_classes.count(cls).to_s + ")"
		end
		file.puts ""
		file.puts "Feats:"
		sorted_feats = []
		panda.feats.each do |feat|
			sorted_feats += [feat.to_s]
		end
		file.puts sorted_feats.sort
		if panda.spells.to_s
			file.puts "\nSpells:"
			file.puts panda.spells.to_s
		end
		file.puts "\nBackground:"
		file.puts panda.history
		file.puts ""
		file.puts panda.primary_motivation
		file.puts ""
		file.puts panda.secondary_motivation
	end
end