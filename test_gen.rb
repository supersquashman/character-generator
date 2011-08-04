require_relative "Character_Generator"

generator = CharacterGenerator.new
generator.generate_specific_level_characters
generator.save_characters