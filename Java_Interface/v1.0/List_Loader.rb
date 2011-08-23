def load_classes(file_path = File.dirname(__FILE__), sources = ["PHB"])
	tempFile = "#{file_path}"
	tempList = Hash.new
	
	Dir.glob(File.join("#{tempFile}", "/", "jruby-complete-1.6.3.jar")).each do |file|
		#puts file
		require file
	end
	Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(tempFile)))}", "/D&D 0.5/Resources/Models/", "ClassModel.rb")).each do |file|
		#puts file
		require file
	end
	Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(tempFile)))}", "/D&D 0.5/Resources/Lists/", "ClassList.rb")).each do |file|
		#puts file
		require file
		tempList = ClassList.list
	end
	sources.each do |book|
		Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(tempFile)))}", "/D&D 0.5/Resources/Books/#{book}/Classes/", "*.rb")).each do |file|
			#puts file
			require file
		end
	end
	return tempList.values.join(";")
end

def load_races(file_path = File.dirname(__FILE__), sources = ["PHB"])
	tempFile = "#{file_path}"
	tempList = Hash.new
	
	Dir.glob(File.join("#{tempFile}", "/", "jruby-complete-1.6.3.jar")).each do |file|
		#puts file
		require file
	end
	Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(tempFile)))}", "/D&D 0.5/Resources/Models/", "RaceModel.rb")).each do |file|
		#puts file
		require file
	end
	Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(tempFile)))}", "/D&D 0.5/Resources/Lists/", "RaceList.rb")).each do |file|
		#puts file
		require file
		tempList = RaceList.list
	end
	sources.each do |book|
		Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(tempFile)))}", "/D&D 0.5/Resources/Books/#{book}/Races/", "*.rb")).each do |file|
			#puts file
			require file
		end
	end
	return tempList.values.join(";")
end

#loader = List_Loader.new
#puts load_classes