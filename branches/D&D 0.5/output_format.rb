require 'prawn'
module OutputFormat

  def OutputFormat.get_file_name(character,ext)
    num = Dir.glob(File.join("#{File.dirname(__FILE__)}", "/Characters", character.name.to_s + "*." + ext)).collect {|x| 
    File.basename(x).match(/\d+/).to_s.to_i
    }.sort.last
    "#{File.dirname(__FILE__)}/Characters/" + ( num ? character.name.to_s + "(" + (num + 1).to_s + ")." + ext : character.name.to_s + "." + ext )
  end
  
  def OutputFormat.pdf(character)
    pdf = Prawn::Document.new
    top = pdf.bounds.top
    pdf.font_size 8
    pdf.text_box "Name: " , :at => [30, top - 10] , :width => 70, :align => :right
    pdf.font_size 14
    pdf.fill_color "000000" 
    pdf.fill_rectangle [100,top - 7], 200, 16 
    pdf.fill_color "ffffff"
    pdf.font "#{File.dirname(__FILE__)}/Fonts/writtenonhishands.ttf"
    pdf.text_box "Sir James Wimberly the Third, Royal Bastard Esquire, 17th in Line", :at => [100,top - 10], :width => 200, :single_line => true, :overflow => :shrink_to_fit, :leading => 0
    pdf.fill_color "000000" 
    pdf.stroke_rounded_rectangle([50, 550], 50, 100, 10)
    pdf.fill_and_stroke_rounded_rectangle([200, 550], 50, 100, 10)
    pdf.join_style :round
    pdf.line_width 10
    pdf.stroke_rectangle([350, 550], 50, 100)
     
    pdf.render_file OutputFormat.get_file_name(character,"pdf")
  end
  
  def OutputFormat.text(character)
    file_name = OutputFormat.get_file_name(character, "txt")
    file = File.new(file_name, "w")
    file.puts(string(character))
		# file.puts "Name:  " + character.name.to_s
		# file.puts ""
		# ["str","dex","con","int","wis","cha"].each do |stat|
			# if (character.stat_mod[stat] >= 0)
				# file.puts stat + "	" + character.stats[stat].to_s + " (+" + character.stat_mod[stat].to_s + ")"
			# else
				# file.puts stat + "	" + character.stats[stat].to_s + " (" + character.stat_mod[stat].to_s + ")"
			# end
		# end
		# file.puts ""
		# file.puts "Level:  " + character.level.to_s #panda.get_level.to_s
		# file.puts "HD:  " + character.HD.to_s
		# template_race_list = []
		# file.puts "HP:  " + character.HP.to_s
		# character.racial_templates.each do |tmplt|
			# template_race_list.push(tmplt.to_s)
		# end
		# file.puts "Gender:  " + character.sex
		# file.puts "Race:  " + template_race_list.join(" ").to_s + " " + character.race.to_s
		# file.puts "Age:  " + character.age.to_s
		# file.puts "Height:  " + ((character.height.to_i/12).floor).to_s + "'" + ((character.height.to_i%12)).to_s + "\""
		# file.puts "Weight:  " + character.weight.to_s + " lbs."
		# file.puts "Alignment: " + character.alignment
		# file.print "Base Attack Bonus:  +" + character.BAB.to_s
		# minus = 5
		# while (minus < character.BAB)
			# file.print "/+" + (character.BAB - minus).to_s
			# minus += 5
		# end
		# file.print "\n"
		# file.puts "Base Land Speed:  " + character.speed.to_s + " ft."
		# file.print "AC:  " + character.ac_list.values.inject(0){|sum,item| sum.to_i + item.to_i}.to_s + " ("
		# separator_counter = 0
		# character.ac_list.each do |modifier, bonus|
			# separator_counter += 1
			# if bonus != 0
				# file.print (separator_counter == 1 ? "" : ", ") + modifier.capitalize + ": " +  bonus.to_s + (separator_counter < character.ac_list.length ? "" : ")")
			# else
				# (separator_counter < character.ac_list.length ? ", " : ")")
				# file.print ")" if (separator_counter >= character.ac_list.length)
			# end
		# end
		# file.print "\n"
		# (file.puts "Spell Resistance:  " + character.spell_resist.to_s) if character.spell_resist > 0
		# file.puts ""
		# file.puts "Classes:  "
		# temp_classes = []
		# character.classes.each {|cls| temp_classes.push(cls.to_s)}
		# temp_classes.uniq.each do |cls|
			# file.puts "    * " + cls.to_s + "(" + temp_classes.count(cls).to_s + ")"
		# end
		# file.print "\nSkills:  \n"
		# file.puts character.skill_list
		# file.print "\nAbilities:  \n"
		# file.puts character.abilities.sort
		# file.puts "\nFavored Classes:  "
		# character.race.favored_classes.each {|cls| file.puts cls}
		# file.print "\nLanguages:  \n"
		# file.puts character.languages
		# file.print "\nFeats:  \n"
		# sorted_feats = []
		# character.feats.each do |feat|
			# sorted_feats += [feat.to_s]
		# end
		# sorted_feats.sort.each do |feat|
			# file.puts "    * " + feat.to_s
		# end
		# if character.spells.to_s
			# file.puts "\nSpells:"
			# file.puts character.spells.to_s
		# end
		# file.puts "\nBackground:"
		# file.puts character.history
		# file.puts ""
		# file.puts character.primary_motivation
		# file.puts ""
		# file.puts character.secondary_motivation
		# file.puts "\nSeed: #{character.seed.to_s}"
		file.close
	end
	
	def OutputFormat.string(character)
		out_string = StringIO.new
		out_string.puts "Name:  " + character.name.to_s
		out_string.puts ""
		["str","dex","con","int","wis","cha"].each do |stat|
			if (character.stat_mod[stat] >= 0)
				out_string.puts stat + "	" + character.stats[stat].to_s + " (+" + character.stat_mod[stat].to_s + ")"
			else
				out_string.puts stat + "	" + character.stats[stat].to_s + " (" + character.stat_mod[stat].to_s + ")"
			end
		end
		out_string.puts ""
		out_string.puts "Level:  " + character.level.to_s #panda.get_level.to_s
		out_string.puts "HD:  " + character.HD.to_s
		template_race_list = []
		out_string.puts "HP:  " + character.HP.to_s
		character.racial_templates.each do |tmplt|
			template_race_list.push(tmplt.to_s)
		end
		out_string.puts "Gender:  " + character.sex
		out_string.puts "Race:  " + template_race_list.join(" ").to_s + " " + character.race.to_s
		out_string.puts "Age:  " + character.age.to_s
		out_string.puts "Height:  " + ((character.height.to_i/12).floor).to_s + "'" + ((character.height.to_i%12)).to_s + "\""
		out_string.puts "Weight:  " + character.weight.to_s + " lbs."
		out_string.puts "Alignment: " + character.alignment
		out_string.puts "Initative: " + character.initiative
		out_string.print "Base Attack Bonus:  +" + character.BAB.to_s
		minus = 5
		while (minus < character.BAB)
			out_string.print "/+" + (character.BAB - minus).to_s
			minus += 5
		end
		out_string.print "\n"
		out_string.puts "Base Land Speed:  " + character.speed.to_s + " ft."
		out_string.puts "Saves:  fort("+ character.fort_save+"), ref("+ character.ref_save +"), will("+ character.will_save")"
		out_string.print "AC:  " + character.ac_list.values.inject(0){|sum,item| sum.to_i + item.to_i}.to_s + " ("
		separator_counter = 0
		character.ac_list.each do |modifier, bonus|
			separator_counter += 1
			if bonus != 0
				out_string.print (separator_counter == 1 ? "" : ", ") + modifier.capitalize + ": " +  bonus.to_s + (separator_counter < character.ac_list.length ? "" : ")")
			else
				(separator_counter < character.ac_list.length ? ", " : ")")
				out_string.print ")" if (separator_counter >= character.ac_list.length)
			end
		end
		out_string.print "\n"
		(out_string.puts "Spell Resistance:  " + character.spell_resist.to_s) if character.spell_resist > 0
		out_string.puts ""
		out_string.puts "Classes:  "
		temp_classes = []
		character.classes.each {|cls| temp_classes.push(cls.to_s)}
		temp_classes.uniq.each do |cls|
			out_string.puts "    * " + cls.to_s + "(" + temp_classes.count(cls).to_s + ")"
		end
		out_string.print "\nSkills:  \n"
		out_string.puts character.skill_list
		out_string.print "\nAbilities:  \n"
		out_string.puts character.abilities.sort
		#out_string.puts "\nFavored Classes:  "
		#character.race.favored_classes.each {|cls| out_string.puts cls}
		out_string.print "\nLanguages:  \n"
		out_string.puts character.languages
		out_string.print "\nFeats:  \n"
		sorted_feats = []
		character.feats.each do |feat|
			sorted_feats += [feat.to_s]
		end
		sorted_feats.sort.each do |feat|
			out_string.puts "    * " + feat.to_s
		end
		if character.spells.to_s
			out_string.puts "\nSpells:"
			out_string.puts character.spells.to_s
		end
		out_string.puts "\nBackground:"
		out_string.puts character.history
		out_string.puts ""
		out_string.puts character.primary_motivation
		out_string.puts ""
		out_string.puts character.secondary_motivation
		out_string.puts "\n\n\nSeed: #{character.seed.to_s}"
		out_string.string
	end
end
