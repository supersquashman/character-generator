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
					created = true
				end
			end
		end
	end
end