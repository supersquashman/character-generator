#require_relative "./Books/PHB/Races/RaceList"
#require_relative "./Books/PHB/Races/ClassList"
require_relative "Lists"

class Character
	#attr_accessor :str, :dex, :con, :int, :wis, :cha, 
	attr_accessor :stats, :skill_points, :HP, :speed, :ability_mods, :ac_list, :fort_save, :will_save, :ref_save, :spell_resist 
	attr_accessor :size, :skill_points, :BAB, :race, :age, :classes
	
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
		@stats = {"str"=>get_stat,"dex"=>get_stat,"con"=>get_stat,"int"=>get_stat,"wis"=>get_stat,"cha"=>get_stat}
		@skill_points = 0
		@ac_list = {"base"=>10, "armor"=>0, "shield"=>0,"dex"=>0,"size"=>0, "enhancement"=>0, "deflection"=>0, "natural"=>0, "dodge"=>0}
		@fort_save = {"base"=>0, "stat"=>0, "misc"=>0}
		@ref_save = {"base"=>0, "stat"=>0, "misc"=>0}
		@will_save = {"base"=>0, "stat"=>0, "misc"=>0}
		@HP = 0
		@BAB = 0
		@speed = 0
		@spell_resist = 0
		@stat_mod = {"str"=>0,"dex"=>0,"con"=>0,"int"=>0,"wis"=>0,"cha"=>0}#[str,dex,con,int,wis,cha]
		@size = "medium"
		@race = "Fish Tornado"
		@age = 0
		#initialize stats
		calculuate_mods
		#get race from race list
		RaceList.list.values[rand(RaceList.list.length)].apply(self)
		#get info based on race
		#get class from list
		#get info based on class
	end
	
	def calculuate_mods
		#@ability_mods = [((@str.to_i-10)/2).floor, ((@dex.to_i-10)/2).floor, ((@con.to_i-10)/2).floor, ((@int.to_i-10)/2).floor, ((@wis.to_i-10)/2).floor, ((@cha.to_i-10)/2).floor]
=begin		
		@stat_mod["str"] = ((@str.to_i-10)/2).floor
		@stat_mod["dex"] = ((@dex.to_i-10)/2).floor
		@stat_mod["con"] = ((@con.to_i-10)/2).floor
		@stat_mod["int"] = ((@int.to_i-10)/2).floor
		@stat_mod["wis"] = ((@wis.to_i-10)/2).floor
		@stat_mod["cha"] = ((@cha.to_i-10)/2).floor
=end
		@stats.each do |stat|
			@stat_mod[stat] = ((@stats[stat].to_i-10)/2)
		end
		@ac_list["size"] = case @size.downcase
			when "medium" then 0
			when "small" then 1
			when "large" then -1
		end
	end
	
	def get_stat
		rolls = [rand(6)+1, rand(6)+1, rand(6)+1, rand(6)+1]
		#rolls = [die[rand(6)], die[rand(6)], die[rand(6)], die[rand(6)]]
		rolls.each do |i|
			current = i
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
end