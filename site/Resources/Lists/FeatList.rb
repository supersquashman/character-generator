# FeatList - Manager of D&D Feats[FeatModel]
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

require_relative "#{File.dirname(__FILE__)}/../Models/FeatModel"
#require './Dice'

#--== FeatList =========================================================================#
#++
class FeatList
	@@list=Hash.new
	attr_accessor :feats

#-- initialize -------------------------------------------------------------------------#
#++
	def initialize 
		@feats = []
	end
	
#-- list -------------------------------------------------------------------------------#
#++
	def list
		return @@list
	end
  
#-- self.push(fea) ---------------------------------------------------------------------#
#++
	def self.push(fea)
		@@list[fea.to_s] = fea
	end
	
#-- self.list --------------------------------------------------------------------------#
#++
	def self.list
		return @@list
	end
  
#-- self.roll_feats(char, num, restriction )--------------------------------------------#
#++
	def self.roll_feats(char, num, restriction=[])
		num.times do 
			available = available_feats(char,restriction)
			if(available.length >0)
				t=rand(available.length)
				available[t].add(char)
				#feats.push(available[t].new)
			else
				char.feats.push(FeatModel.new("Additional Feat"))
			end
		end
	end
  
#-- self.available_feats( char, restriction) -------------------------------------------#
#++
	def self.available_feats (char , restriction=[])
		available = []
		list.each do |title,feat|
			if feat.available?(char)
				restriction.length<1 || restriction.include?(feat.new.title) ? available.push(feat) : 0
			end
		end
		return available
	end
	
#-- self.get_bonus_feat(char, class_type) ----------------------------------------------#
#++
	def self.get_bonus_feat(char, class_type)
		available = available_feats(char)
		if(available.length >0)
			feat_added = false
			while (!feat_added && available.length >0)
				t=rand(available.length)
				if (available[t].is_bonus_feat?(class_type)) #&& !char.feats.contains?(available[t]))	
					available[t].add(char)
					feat_added = true
				else
					available.slice!(t)
				end
			end
			if !feat_added
				char.feats.push(FeatModel.new("Additional " + class_type +" Bonus Feat"))
			end
			#feats.push(available[t].new)
		else
			char.feats.push(FeatModel.new("Additional " + class_type +" Bonus Feat"))
		end
	end
	
#-- to_s -------------------------------------------------------------------------------#
#++
	def to_s
		ret =""
		feats.each {|feat| ret+="\t* "+feat.title.to_s+"\n" }
		return ret
	end
end