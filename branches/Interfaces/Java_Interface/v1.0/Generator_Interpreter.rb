def generate(file_path = File.dirname(__FILE__), args = "")
	tempFile = "#{file_path}"
	tempList = Hash.new
	argList = args.split(";") #[[races],[classes],char_count,level_type,min_level,max_level]
	argList[0] = argList[0].split(",")
	argList[1] = argList[1].split(",")
	test = File.new("test.txt","w")
	test.puts(argList)
	test.close
	
	Dir.glob(File.join("#{tempFile}", "/", "jruby-complete-1.6.3.jar")).each do |file|
		#puts file
		#require file
	end
	Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(tempFile)))}", "/D&D 0.5/", "Characte_Generator.rb")).each do |file|
		#puts file
		require file
	end
	#generator = CharacterGenerator.new
	#generator.generate_specific_level_characters(number_of_characters.to_i, char_level.to_i, num_classes.to_i,)
	#return tempList.values.join(";")
end