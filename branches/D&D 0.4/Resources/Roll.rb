# Roll - manager for string based dice rolls
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


#--== Roll =============================================================================#
#++
# Class manages dice and stat rolls

# Members :
# result[Integer] - stores the intger result of the roll
# dice[Hash (key=sides, value=multiplier)] - stores the count of each type of die
# original[String] - stores the original string that was parsed. Ex: 1d6+5

# Methods : initialize(roll), parse, make_rolls, to_s, to_i,
# -(roll), +(roll), self.best(n, of_m), self.stats
class Roll
	attr_accessor :result, :dice, :original
        
        
#-- initialize -------------------------------------------------------------------------#
#++
# Creates a roll instance for the string parameter. The string will be stored in 
# Roll::original, parsed to the Roll::dice hash and the result of the roll stored 
# in Roll::result. 
	def initialize (roll = "1d6")
		@original = roll
		self.parse
		self.make_rolls
	end
        
        
#-- parse ------------------------------------------------------------------------------#
#++
# Using regex this method will parse the original string into its die components 
# (stored in Roll::dice) where each key is the number of sides and value is the number 
# of that particular type of die.
	def parse
		@dice = Hash.new
		list = original.gsub(/\s+/,"").scan(/\-?[\s*0-9d]+/)
		list.each do |die,val|
			Integer mul = /\-?[0-9]+/.match(die).to_s.to_i
			re = /(?:d)([0-9]+)/.match(die)
			Integer sides = re ? re[1].to_s.to_i : 1
			@dice[sides] ? @dice[sides] += mul :@dice[sides] = mul
		end
	end
        
        
#-- make_rolls -------------------------------------------------------------------------#
#++
# This method will make all of the die rolls for the dice stored in the Roll::dice hash.
# This method can be used to re-roll the dice at a later time
	def make_rolls
		@result = 0
		@dice.each  {|sides, mul| mul.times{sides>0 ? @result += rand(sides)+1 : 0} }
	end
        
        
#-- to_s -------------------------------------------------------------------------------#
#++
# To String method will return a string with the dice hash converted to a readable 
# rendering of the dice roll and the result of that roll
	def to_s
		return result.to_s
	end

	
#-- get_subset -------------------------------------------------------------------------------#
#++
# The get_subset method will return a string with the dice hash converted to a readable 
# rendering of the dice roll and the result of that roll	
	def get_subset
		String ret=""
		list = dice.keys.sort.reverse
		list.each do |sides| 
			if dice[sides]!=0 
				ret += (dice[sides]>=0 && sides!=list.first ? "+":"") 
				ret += dice[sides].to_s + (sides>1 ? "d"+sides.to_s : "")
			end
		end
		ret += (" (" + result.to_s + ")")
		return ret
	end
        
        
#-- to_i -------------------------------------------------------------------------------#
#++
# To Integer method will return the result of the roll
	def to_i
		return result.to_i
	end

#-- -(roll2) ---------------------------------------------------------------------------#
#++
# Add method will return a new Roll with the Roll:original containing the 
# appended original strings joined with +, Roll::dice containing the sum of the dice hashes, 
# and result containing the sum of the results
	def +(roll2)
		if roll2.is_a?(Roll)
			total = dice
			roll2.dice.each do|sides,mul|
				total[sides]? total[sides]+= mul :total[sides] = mul
			end
			ret = Roll.new
			ret.original = @original + "+" + roll2.original
			ret.dice = total
			ret.result = @result + roll2.result
			return ret
		else if roll2.is_a?(Integer)
			return self.to_i + roll2
		else
			return self.to_s + roll2
		end
		end
	end
        
        
#-- -(roll2) ----------------------------------------------------------------------------#
#++
# Subtract method will return a new Roll with the Roll:original containing the appended 
# original strings joined with -(toggling +/-), Roll::dice containing the difference 
# of the dice hashes, and result containing the difference of the results
	def -(roll2)
		if roll2.is_a?(Roll)
			total = dice
			roll2.dice.each do|sides,mul|
				total[sides]? total[sides]-= mul :total[sides] = -mul
			end
			ret = Roll.new
			ret.original = @original + "-" + (roll2.original).gsub(/\+/,"-").gsub(/\-/,"+")
			ret.dice = total
			ret.result = @result - roll2.result
			return ret
		else if roll2.is_a?(Integer)
			return self.to_i - roll2
		else
			return self.to_s - roll2
		end
		end
	end
#-- max ----------------------------------------------------------------------------------#
#++
# sets a roll with the max result
	def max
		new_roll = self.dup
		new_roll.result = 0
		new_roll.dice.each  {|sides, mul| new_roll.result += mul*sides }
		return new_roll
	end
#-- min ----------------------------------------------------------------------------------#
#++
# returns a roll with the min result
	def min
		new_roll = self.dup
		new_roll.result = 0
		new_roll.dice.each  {|sides, mul| new_roll.result += mul }
		return new_roll
	end
#-- best(n, of_m) ------------------------------------------------------------------------#
#++
# best returns the best m of n d6 rolls
	def self.best(m, of_n)
		eval(Array.new(of_n) {rand(6)+1}.sort.reverse.take(m).join("+"))
	end
#-- stats --------------------------------------------------------------------------------#
#++
# rolls the hash of stats using the best 3 of 4d6 method
	def self.stats
		stats = Hash.new
		["int","wis","cha","dex","str","con"].each {|k| stats[k] = Roll.best(3,4)}
		return stats
	end
end


        ##-------------##
        ##-- EXAMPLE --##
        ##-------------##
# r1 = Roll.new("2d6+3d6 -10d2 -5")
# r2 = Roll.new("2d8+3d10 -10d2 -5")
# print r1 +"\n"
# print r2 +"\n"
# print (r1+r2) +"\n"
# print (r1-r2) +"\n"
# print Roll.new("2d8+3d10 -10d2 -5").to_i.to_s + "\n"
# print 
# stats = Roll.stats
# mods= Hash.new
# stats.each {|key,value| mods[key] = (value-10)>0 ? ((value-10.0)/2).floor.to_i : ((value-10.0)/2).ceil.to_i}
# puts stats
# puts mods