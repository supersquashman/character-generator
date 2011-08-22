Dir.glob(File.join("#{File.dirname(__FILE__)}", "/", "jruby-complete-1.6.3.jar")).each do |file|
	require file
end
class List_Loader
	def load_classes(sources = ["PHB"])
		Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(File.dirname(__FILE__))))}", "/D&D 0.5/Resources/Lists/", "ClassList.rb")).each do |file|
			#puts file
			require file
		end
		Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(File.dirname(__FILE__))))}", "/D&D 0.5/Resources/Models/", "ClassModel.rb")).each do |file|
			#puts file
			require file
		end
		sources.each do |book|
			Dir.glob(File.join("#{File.dirname(File.dirname(File.dirname(File.dirname(__FILE__))))}", "/D&D 0.5/Resources/Books/#{book}/Classes/", "*.rb")).each do |file|
				#puts file
				require file
			end
		end
		ClassList.list.values
	end
end

loader = List_Loader.new
puts loader.load_classes.values