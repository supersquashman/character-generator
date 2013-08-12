class Name
attr_accessor :name, :pre, :post
	@@tokens = Hash.new(Hash.new(Hash.new([])))
	@token_categories = ["General"]
	@alignment=""
  
	def self.load(relative_path="Names")
		Dir.glob(File.join("#{File.dirname(__FILE__)}", "/*/*.txt")).each do |file|
		#Dir.glob(File.join(".", "*/*.txt")).each do |file|
			File.open(file, "r") do |file|
				while(line = file.gets) 
					hash2 = File.basename(file.path, ".txt")
					hash1 = File.dirname(file.path).match(/[^\/]*$/).to_s
					@@tokens["[" + hash1 + "]"] = Hash.new([]) if @@tokens["[" + hash1 + "]"].length < 1
					@@tokens["[" + hash1 + "]"]["[" + hash2 + "]"] += [line.chomp] if line.chomp!=""
				end
			end
		end
	end
  
	def initialize(character)
		@result = ""
		@alignment= character.alignment
		@gender = rand(20)!=0 ? character.sex : ["Male","Female"][(rand(2))] #gender confusion?
		@race = character.race.to_s
		["Human","Elf","Dwarf","Gnome","Halfling"].include?(@race.include?("Elf") ? "Elf" : @race.include?("Dwarf") ? "Dwarf" : @race) ? @name_token_categories = ["[" + @race + "]", "[General]"] : @name_token_categories = ["[Monster]", "[General]"]
		@name = ""
		@pre = ""
		@post = ""
		generate
	end

	def generate(alignment=@alignment)
		begin 
			choice=@name_token_categories[rand(@name_token_categories.length+1)] 
		end while(@@tokens[choice].length < 1)
		@name = pick_line(choice,"[rules]").split(" ").each{|word| word.capitalize!}.join(" ")
		@pre = pick_line(choice,"[pretitle]").split(" ").each{|word| word.capitalize!}.join(" ")
		@post = pick_line("[Title]","[title]").split(" ").each{|word| word.capitalize!}.join(" ")
	end

	def pick_line (hash="[Dwarf]", hash2="[rules]", alignment=@alignment, gender=@gender)
		line = ""
		if @@tokens[hash][hash2].length > 0
			parts = []
			begin while ((line = @@tokens[hash][hash2][rand(@@tokens[hash][hash2].length)].dup) == ""); end
				parts = line.partition("|")
				line = parts[1]=="" ? parts[0] : parts[2]
			end while (! qualified(parts[1]=="" ? "" : parts[0],alignment))
			line.gsub!(/\[[^\]]+\]/){|new_hash| pick_line(hash, new_hash)}
			#return line
		end
		return line
	end

	def qualified (code, alignment=@alignment, gender=@gender)
		#return true if code.strip==""
		ret = true
		if (code.strip!="")
			code.each_char do|c|
				case c
				#alignment
				when "c"
					ret &&= !["Chaotic Good","Chaotic Neutral","Chaotic Evil"].include?(alignment)
				when "l"
					ret &&= !["Lawful Good","Lawful Neutral","Lawful Evil"].include?(alignment)
				when "N"
					ret &&= !["Neutral Good","Neutral","Neutral Evil"].include?(alignment)
				#goodness?
				when "g"
					ret &&= !["Chaotic Good","Neutral Good","Lawful Good"].include?(alignment)
				when "e"
					ret &&= !["Chaotic Evil","Neutral Evil","Lawful Evil"].include?(alignment)
				when "n"
					ret &&= !["Chaotic Neutral","Neutral", "Lawful Neutral"].include?(alignment)
        when "M"
					ret &&= gender=="Male"
        when "F"
					ret &&= gender=="Female"
				end
			end
		end
		return ret
	end
	
	def to_s
    ret =""
    #ret += @pre + " " if @pre!=""
    ret += @name if @name!=""
    #ret += ", " + @post if @post!=""
		return ret
	end
end

Name.load("Resources/Names/")