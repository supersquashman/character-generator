require_relative "/Resources/Character"

class CharacterGenerator
	@@character_list = []

	def generate_specific_level_characters(char_level = 1, book_list = ["PHB"], char_count = 1)
		char_count.times do
			@@character_list.push(Character.new(book_list))
		end
		@@character_list.times do |character|
			character.max_classes = 1
			char_level.times do
				character.level_up
			end
		end
		character.final_levelup_procs.each{|proc| proc.call character}
	end
	
	def generate_level_range_characters(char_low_level =1, char_high_level = 20, book_list = ["PHB"], , char_count = 1)
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
		
		end
	end
end