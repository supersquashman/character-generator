# Character - Model of D&D skills and container for related information
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

#require_relative "./Books/PHB/Races/RaceList"
#require_relative "./Books/PHB/Races/ClassList"
#require_relative "./Lists/SkillList"
#require_relative "./Lists/ClassList"
#require_relative "./Lists/RaceList"
#require_relative "./Lists/LanguageList"
Dir.glob(File.join(".", "/Lists", "*.rb")).each do |file|
   require file
end
Dir.glob(File.join(".", "/Models", "*.rb")).each do |file|
   require file
end

#--== Character ========================================================================#
#++
class Character
	#attr_accessor :str, :dex, :con, :int, :wis, :cha, 
	attr_accessor :stats, :skill_points, :HP, :HD, :speed, :ability_mods, :ac_list, :fort_save, :will_save, :ref_save, :spell_resist, :spells_known, :forbidden_spell_types, :spell_book, :spells_per_day
	attr_accessor :size, :skill_list, :BAB, :race, :age, :classes, :abilities, :level, :level_up, :stat_mod, :armor_check, :languages, :feats
	
	def initialize (sources)
=begin
		@str = get_stat
		@dex = get_stat
		@con = get_stat
		@int = get_stat
		@wis = get_stat
		@cha = get_stat
=end
		@classes = []
		@abilities = []
		@feats = []#FeatList.new
		@level = 0
    @spells_known = SpellModel.all_spells #Hash.new(Hash.new([]))
    @forbidden_spell_types = []
		@stats = {"str"=>get_stat,"dex"=>get_stat,"con"=>get_stat,"int"=>get_stat,"wis"=>get_stat,"cha"=>get_stat}
		@skill_points = 0
		@ac_list = {"base"=>10, "armor"=>0, "shield"=>0,"dex"=>0,"size"=>0, "enhancement"=>0, "deflection"=>0, "natural"=>0, "dodge"=>0}
		@armor_check = 0
		@fort_save = {"base"=>0, "stat"=>0, "misc"=>0}
		@ref_save = {"base"=>0, "stat"=>0, "misc"=>0}
		@will_save = {"base"=>0, "stat"=>0, "misc"=>0}
		@HP = 0
		@HD = 0
		@BAB = 0
		@speed = 0
		@spell_resist = 0
		@stat_mod = {"str"=>0,"dex"=>0,"con"=>0,"int"=>0,"wis"=>0,"cha"=>0}#[str,dex,con,int,wis,cha]
		@size = "medium"
		@race = "Fish Tornado"
		@age = 0
		@languages = LanguageList.new
		@skill_list = SkillList.new(self)
		#initialize stats
		calculate_mods
		#get race from race list
		RaceList.list.values[rand(RaceList.list.length)].apply(self)
		#get info based on race
		#get class from list
		#get info based on class
		#get feats
		
=begin	
		@level_up = [Proc.new do |c, i|
			#i==0||(i+1)%3==0 ? c.feats.roll_feats(c,1):0
			c.race.apply_level
			sel = ClassList.list.values[rand(ClassList.list.length)]
			sel.apply(c)
=begin
			c.skill_list.class_skills |= sel.Class_skills
			c.skill_list.roll_skills(sel.skill_ranks(c))
/=end
			calculate_mods
		end]
=end
	end
	
	def level_up
		@level += 1
		FeatList.roll_feats(self,1) if @level == 1 || @level%3 == 0
		self.race.apply_level
		#selected_class = ClassList.list.values[rand(ClassList.list.length)]
		#selected_class.apply(self)
		@classes.push(ClassList.list.values[rand(ClassList.list.length)].new(self))
=begin
			c.skill_list.class_skills |= sel.Class_skills
			c.skill_list.roll_skills(sel.skill_ranks(c))
=end
		calculate_mods
	end
        
	def calculate_mods
		@stats.keys.each do |stat|
			@stat_mod[stat] = ((@stats[stat].to_i-10)/2).floor
		end
		@ac_list["size"] = case @size.downcase
			when "medium" then 0
			when "small" then 1
			when "large" then -1
		end
	end
        
	def increase_ability(name, number=1,dice="+")
		found = false
		self.abilities.each do |ability|
			if ability.to_s.include? name.scan(/[^0-9]/)[0]
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
        
	def add_ability (text)
		self.abilities.include?(text) ? 0 : self.abilities.push(text)
	end
	
        #[DEP] marked for removal ???????????????????
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
	
	#def get_level
	#	return classes.length
	#end
end