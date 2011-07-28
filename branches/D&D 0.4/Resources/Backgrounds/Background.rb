class Background
	attr_accessor :primary_motivation, :secondary_motivation, :history
	@@background = Hash.new([])
	@result = ""
	@alignment=""
  
	def self.load(relative_path="Backgrounds")
		Dir.glob(File.join(".", relative_path, "*.txt")).each do |file|
			File.open(file, "r") do |file|
				while(line = file.gets)
					hash = File.basename(file.path, ".txt")
					@@background["[" + hash + "]"] += [line.chomp] if line.chomp!=""
				end
			end
		end
	end
  
	def initialize(alignment="")
		@result = ""
		@alignment= alignment
		generate
	end

	def generate(alignment=@alignment)
		@history = "History: " + pick_line("[histories]",alignment)# + "\n\n"
		@primary_motivation = "Primary Motivation: " + pick_line("[motivations]",alignment)# + "\n\n"
		@secondary_motivation = "Secondary Motivation:  " + pick_line("[motivations]", alignment)
	end

	def pick_line (hash="[motivations]", alignment=@alignment)
		line = ""
		if @@background[hash].length > 0
			begin 
				while ((line = @@background[hash][rand(@@background[hash].length)]) == ""); end
					parts = line.partition("|")
					line = parts[1]=="" ? parts[0] : parts[2]
			end while (! qualified(parts[1]=="" ? "" : parts[0],alignment))
			#line.gsub!(/\[[[^\]]+\]/){|new_hash| pick_line(new_hash)}
				#return line
		end
		return line
	end

	def qualified (code, alignment=@alignment)
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
					ret &&= alignment[0]!="N"
				end
			end
		end
		return ret
	end
	
	def to_s
		return @result
	end
end

Background.load
#puts Background.new("LG")