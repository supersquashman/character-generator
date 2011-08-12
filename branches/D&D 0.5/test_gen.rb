require_relative "#{File.dirname(__FILE__)}/Character_Generator"

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
=begin
if (char_level.to_i < num_classes.to_i)
	num_classes = char_level.to_i
end
=end
generator = CharacterGenerator.new
generator.generate_specific_level_characters(number_of_characters.to_i, char_level.to_i, num_classes.to_i,["PHB", "MM1"])
generator.save_characters
OutputFormat.text(generator.regenerate_specific_level_character(1,1,["PHB", "MM1"],89040110133916598451619148324716886324))