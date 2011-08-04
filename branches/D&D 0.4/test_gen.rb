require_relative "Character_Generator"

print "Number of characters to generate:  "
number_of_characters = gets.chomp
print "Character level:  "
char_level = gets.chomp

generator = CharacterGenerator.new
generator.generate_specific_level_characters(number_of_characters.to_i, char_level.to_i)
generator.save_characters