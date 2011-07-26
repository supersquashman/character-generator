class Name
attr_accessor :name, :pre, :post
	@@tokens = Hash.new(Hash.new(Hash.new([])))
  @token_categories = ["General"]
	@alignment=""
  
	def self.load(relative_path="Names")
		#Dir.glob(File.join(".", relative_path, "*/*.txt")).each do |file|
    Dir.glob(File.join(".", "*/*.txt")).each do |file|
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
    @name_token_categories = ["General"]
		@alignment= "CN"#character.alignment
    @gender = "Male" #rand(20)!=0 ? character.sex : ["Male","Female"][(rand(2))] #gender confusion?
    @race = "Halfling"#"[" + character.race.to_s + "]"
    @name = ""
    @pre = ""
    @post = ""
		generate
	end

	def generate(alignment=@alignment)
    race_hash = "[" + @race + "]"
    @name = pick_line(race_hash,"[rules]").split(" ").each{|word| word.capitalize!}.join(" ")
    @pre = pick_line(race_hash,"[pretitle]").split(" ").each{|word| word.capitalize!}.join(" ")
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
					ret &&= alignment[0]!="C"
				when "l"
					ret &&= alignment[0]!="L"
				when "N"
					ret &&= alignment[0]!="N"
				#goodness?
				when "g"
					ret &&= alignment[1]!="G"
				when "e"
					ret &&= alignment[1]!="E"
				when "n"
					ret &&= alignment[1]!="N"
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
    ret += @pre + " " if @pre!=""
    ret += @name if @name!=""
    ret += " " + @post if @post!=""
		return ret
	end
end

Name.load
100.times { test = Name.new(10).to_s
puts ""
puts test}