# Character - Model for D&D characters and container for related information
# Copyright (C) 2011  Cody Garrett, Josh Murphy, and Matt Ingram

# This file is part of FishTornado D&D Character Generator.

# FishTornado D&D Character Generator is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# FishTornado D&D Character Generator is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with FishTornado D&D Character Generator.  If not, see <http://www.gnu.org/licenses/>.

Dir.glob(File.join("#{File.dirname(__FILE__)}", "/Lists", "*.rb")).each do |file|
   require file
end
Dir.glob(File.join("#{File.dirname(__FILE__)}", "/Models", "*.rb")).each do |file|
   require file
end
require_relative File.join("#{File.dirname(__FILE__)}", "/Backgrounds/Background")
require_relative File.join("#{File.dirname(__FILE__)}", "/Names/Name")
require 'bson'

#--== Character ========================================================================#
#++
class Character
	attr_accessor :stats, :skill_points, :HP, :HD, :sex, :height, :weight, :speed, :ability_mods, :ac_list, :fort_save, :will_save, :ref_save, :spell_resist, :spells
	attr_accessor :size, :skill_list, :BAB, :caster_level, :race, :age, :classes, :abilities, :level, :level_up, :stat_mod, :armor_check, :languages, :feats, :secondary_motivation
	attr_accessor :max_classes, :grapple, :extra_levelup_procs, :final_levelup_procs, :armor_proficiencies, :weapon_proficiencies, :history, :primary_motivation
	attr_accessor :CR, :ECL, :alignment, :initiative, :racial_templates, :name, :forbidden_spell_types, :seed, :feat_restriction, :class_restriction, :race_restriction
	
#-- initialize (races) ---------------------------------------------------------------#
#++
	def initialize (races, classes, feats, seed = 0)
		@seed = seed
		@extra_levelup_procs = []
		@final_levelup_procs = []
		@armor_proficiencies = []
		@weapon_proficiencies = []
		@initiative = 0
		@classes = []
    @class_restriction = classes
    @race_restriction = races
		@number_of_classes = 0
		@max_classes = 1
		@abilities = []
		@feats = []
    @feat_restriction = feats
		@level = 0
		@spells = SpellList.new
		@forbidden_spell_types = []
		@stats = {"str"=>get_stat,"dex"=>get_stat,"con"=>get_stat,"int"=>get_stat,"wis"=>get_stat,"cha"=>get_stat}
		@stat_mod = {"str"=>0,"dex"=>0,"con"=>0,"int"=>0,"wis"=>0,"cha"=>0}
		@skill_points = 0
		@ac_list = {"base"=>10, "armor"=>0, "shield"=>0,"dex"=>0,"size"=>0, "enhancement"=>0, "deflection"=>0, "natural"=>0, "dodge"=>0}
		@armor_check = 0
		@fort_save = {"base"=>0, "stat"=>0, "misc"=>0}
		@ref_save = {"base"=>0, "stat"=>0, "misc"=>0}
		@will_save = {"base"=>0, "stat"=>0, "misc"=>0}
		@HP = 0
		@HD = 0
		@CR = 0
		@ECL = 0
		@BAB = 0
		@caster_level = 0
		@grapple = {"BAB" => @BAB, "size" => 0, "misc" => 0}
		@speed = 0
		@spell_resist = 0
		@size = "medium"
		#[TODO] Templates
		@age = 0
		#Gender: 0 = male, 1 = female
		@sex = ["Male","Female"][(rand(2))]
		@height = 0
		@weight = 0
		@languages = LanguageList.new 
		@skill_list = SkillList.new(self)
		@alignment = ["Chaotic Good","Neutral Good","Lawful Good","Chaotic Neutral","Neutral","Lawful Neutral","Chaotic Evil","Neutral Evil","Lawful Evil"][rand(9)]
		background = Background.new(@alignment)
		@history = background.history
		@primary_motivation = background.primary_motivation
		@secondary_motivation = background.secondary_motivation
		@temp_templates = Array.new
		@racial_templates = Array.new
		#initialize stats
		calculate_mods
		#get race from race list
		@race = RaceList.select_race(race_restriction)
		while (@race.is_template)
			#@race.apply(self) if !@templates.include?(@race)
			@temp_templates.push(@race) if !@temp_templates.include?(@race)
			@race = race_restriction.length > 1 ? RaceList.select_race(race_restriction) : RaceList.select_race
		end
		@race.apply(self)
		@temp_templates.each {|template| template.apply(self)} if @temp_templates.length > 0
		#get info based on race
		#get class from list
		#get info based on class
		#get feats
		@name = Name.new(self)
	end
  
#-- levelup ----------------------------------------------------------------------------#
#++	
	def level_up
		@level += 1
		@ECL += 1
		self.race.apply_level
		self.racial_templates.each {|template| template.apply_level} if self.racial_templates.length > 0
		@stats[stats.keys[rand(stats.keys.length)]] += 1 if (@level%4 == 0)
		if @number_of_classes < @max_classes
			i=0
			begin
				selected=ClassList.select_class(class_restriction).new(self)
				i +=1
				raise "Can't find an available class" if (i >= 100) 
			end while(!selected.available?)
			@classes.push(selected)
			temp_classes = []
			@classes.each {|cls| temp_classes.push(cls.to_s)}
			@number_of_classes = temp_classes.uniq.length
		else
			selected = @classes[rand(@classes.length)].class.new(self)
			@classes.push(selected)
		end
		selected.apply
		FeatList.roll_feats(self,1) if @level == 1 || @level%3 == 0
		extra_levelup_procs.each{|proc| eval(proc).call self}
		calculate_mods
	end
 
#-- calculate_mods ---------------------------------------------------------------------#
#++ 
	def calculate_mods
		@stats.keys.each do |stat|
			@stat_mod[stat] = ((@stats[stat].to_i-10)/2).floor
		end
		@ac_list["size"] = case @size.downcase
			when "medium" then 0
			when "small" then 1
			when "large" then -1
		end
		
		@grapple["size"] = case @size.downcase
			when "medium" then 0
			when "small" then 1
			when "large" then 4
		end
		@ac_list["dex"] = @stat_mod["dex"]
	end

#-- increase_ability(name, number, dice) -----------------------------------------------#
#++  
	def increase_ability(name, number=1,dice="+")
		found = false
		self.abilities.each do |ability|
			if ability.to_s.include? name.scan(/\D+/)[0]
				inc_name=ability.sub(/\d{1,}/) {|n| n.to_i+number}
				self.abilities[self.abilities.index(ability)] = inc_name
				found = true
			end
		end
		if !found 
			if dice==""
				ability_name = name
			elsif dice=="+"
				ability_name = name + " +" + number.to_s 
			else
				ability_name = name + " +" + number.to_s + dice
			end
			self.add_ability(ability_name)
		end
	end

#-- add_ability (text) -----------------------------------------------------------------#
#++
	def add_ability (text)
		self.abilities.include?(text) ? 0 : self.abilities.push(text)
	end
	
#-- remove_ability (text) -----------------------------------------------------------------#
#++
	def remove_ability (text, partial=false)
		if (partial)
			self.abilities.each do |ability|
				self.abilities.delete(ability.to_s) if ability.include?(text)
			end
		else
			self.abilities.include?(text) ? self.abilities.delete(text) : 0
		end
	end
	
#-- has_ability (text) -----------------------------------------------------------------#
#++
	def has_ability (text)
		included = false
		self.abilities.each do |ability|
			included = true if ability.include?(text)
		end
		#include?(text) ? self.abilities.delete(text) : 0
		return included
	end
	
#-- get_ability_level (text) -----------------------------------------------------------------#
#++
	def get_ability_level (text)
		ability_level = "0"
		self.abilities.each do |ability|
			if ability.to_s.include? text.scan(/\D+/)[0]
				if ability.to_s.scan(/\d{1,}(d)\d{1,}/)
					ability_level = ability.scan(/\d{1,}(d)\d{1,}/)
				else
					ability_level = ability.scan(/\d{1,}/)
				end
			end
		end
		
		return ability_level.to_s
	end
	
#-- get_stat ---------------------------------------------------------------------------#
#++
	def get_stat
		rolls = [rand(6)+1, rand(6)+1, rand(6)+1, rand(6)+1]
		rolls.each do |i|
			current = i
			#Reroll any 1's
			while i == 1
				newroll = rand(6)+1
				rolls[i] = rand(6)+1
				i = rolls[i]
			end
		end
		sum = 0
		rolls.sort.reverse[0..2].each do |i|
			sum += i.to_i
		end
		return sum
	end

#-- apply_size -------------------------------------------------------------------------#
	def apply_size
		hide_hash = {"Fine"=>16, "Diminutive"=>12, "Tiny"=>8, "Small"=>4, "Medium"=>0, "Large"=>-4, "Huge"=>-8, "Gargantuan"=>-12, "Colossal"=>-16}
		grapple_hash = {"Fine"=>-16, "Diminutive"=>-12, "Tiny"=>-8, "Small"=>-4, "Medium"=>0, "Large"=>4, "Huge"=>-8, "Gargantuan"=>-12, "Colossal"=>-16}
		size_hash = {"Fine"=>8, "Diminutive"=>4 ,"Tiny"=>2, "Small"=>1, "Medium"=>0, "Large"=>-1, "Huge"=>-2, "Gargantuan"=>-4, "Colossal"=>-8}
		@skill_list.assign_misc("Hide", hide_hash[@size]) if hide_hash[@size] != 0
		@grapple["size"] = grapple_hash[@size]
		@ac_list["size"] = size_hash[@size]
	end
#-- apply_size -------------------------------------------------------------------------#
	def final_levelup
		final_levelup_procs.each do |proc|
      # p proc
      eval(proc).call(self)
    end
		apply_size
	end
  
#-- to_mongo(value) --------------------------------------------------------------------#
  def self.to_mongo(value)
    BSON::Binary.new(Marshal::dump(value))
  end
#-- from_mongo(value) ------------------------------------------------------------------#
  def self.from_mongo(value)
    return Marshal::load(value.to_s) if value.is_a? BSON::Binary
    value if value.is_a? Character
  end
#-- string -----------------------------------------------------------------------------#
  def string
		out_string = StringIO.new
		out_string.puts "Name:  " + self.name.to_s
		out_string.puts ""
		["str","dex","con","int","wis","cha"].each do |stat|
			if (self.stat_mod[stat] >= 0)
				out_string.puts stat + "	" + self.stats[stat].to_s + " (+" + self.stat_mod[stat].to_s + ")"
			else
				out_string.puts stat + "	" + self.stats[stat].to_s + " (" + self.stat_mod[stat].to_s + ")"
			end
		end
		out_string.puts ""
		out_string.puts "Level:  " + self.level.to_s #panda.get_level.to_s
		out_string.puts "HD:  " + self.HD.to_s
		template_race_list = []
		out_string.puts "HP:  " + self.HP.to_s
		self.racial_templates.each do |tmplt|
			template_race_list.push(tmplt.to_s)
		end
		out_string.puts "Gender:  " + self.sex
		out_string.puts "Race:  " + template_race_list.join(" ").to_s + " " + self.race.to_s
		out_string.puts "Age:  " + self.age.to_s
		out_string.puts "Height:  " + ((self.height.to_i/12).floor).to_s + "'" + ((self.height.to_i%12)).to_s + "\""
		out_string.puts "Weight:  " + self.weight.to_s + " lbs."
		out_string.puts "Alignment: " + self.alignment
		out_string.puts "Initative: " + self.initiative.to_s
		out_string.print "Base Attack Bonus:  +" + self.BAB.to_s
		minus = 5
		while (minus < self.BAB)
			out_string.print "/+" + (self.BAB - minus).to_s
			minus += 5
		end
		out_string.print "\n"
		out_string.puts "Base Land Speed:  " + self.speed.to_s + " ft."
		out_string.puts "Saves:  fort("+ self.fort_save.values.inject(0){|sum,bonus| sum.to_i+bonus.to_i}.to_s+"), ref("+ self.ref_save.values.inject(0){|sum,bonus| sum.to_i+bonus.to_i}.to_s+"), will("+ self.will_save.values.inject(0){|sum,bonus| sum.to_i+bonus.to_i}.to_s+")"
		out_string.print "AC:  " + self.ac_list.values.inject(0){|sum,item| sum.to_i + item.to_i}.to_s + " ("
		separator_counter = 0
		self.ac_list.each do |modifier, bonus|
			separator_counter += 1
			if bonus != 0
				out_string.print (separator_counter == 1 ? "" : ", ") + modifier.capitalize + ": " +  bonus.to_s + (separator_counter < self.ac_list.length ? "" : ")")
			else
				(separator_counter < self.ac_list.length ? ", " : ")")
				out_string.print ")" if (separator_counter >= self.ac_list.length)
			end
		end
		out_string.print "\n"
		(out_string.puts "Spell Resistance:  " + self.spell_resist.to_s) if self.spell_resist > 0
		out_string.puts ""
		out_string.puts "Classes:  "
		temp_classes = []
		self.classes.each {|cls| temp_classes.push(cls.to_s)}
		temp_classes.uniq.each do |cls|
			out_string.puts "    * " + cls.to_s + "(" + temp_classes.count(cls).to_s + ")"
		end
		out_string.print "\nSkills:  \n"
		out_string.puts self.skill_list
		out_string.print "\nAbilities:  \n"
		out_string.puts self.abilities.sort
		#out_string.puts "\nFavored Classes:  "
		#self.race.favored_classes.each {|cls| out_string.puts cls}
		out_string.print "\nLanguages:  \n"
		out_string.puts self.languages
		out_string.print "\nFeats:  \n"
		sorted_feats = []
		self.feats.each do |feat|
			sorted_feats += [feat.to_s]
		end
		sorted_feats.sort.each do |feat|
			out_string.puts "    * " + feat.to_s
		end
		if self.spells.to_s
			out_string.puts "\nSpells:"
			out_string.puts self.spells.to_s
		end
		out_string.puts "\nBackground:"
		out_string.puts self.history
		out_string.puts ""
		out_string.puts self.primary_motivation
		out_string.puts ""
		out_string.puts self.secondary_motivation
		out_string.puts "\n\n\nSeed: #{self.seed.to_s}"
		out_string.string
	end
end
