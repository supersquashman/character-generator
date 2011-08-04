require_relative "Character_Generator"

print "Number of characters to generate:  "
number_of_characters = gets.chomp
print "Character level:  "
char_level = gets.chomp
if (char_level.to_i > 1)
print "Number of classes:  "
	num_classes = gets.chomp
else
	num_classes = 1
end

if (char_level.to_i > num_classes.to_i)
	num_classes = char_level.to_i
end

generator = CharacterGenerator.new
generator.generate_specific_level_characters(number_of_characters.to_i, char_level.to_i, num_classes.to_i,["PHB", "MM1"])
generator.save_characters