# FeatModel - Model of D&D feats and container for related information
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

require_relative "../Roll"

#--== FeatModel ========================================================================#
#++
class FeatModel
	attr_accessor :title,:description,:page,:type,:link,:bonus_feat, :bonus_classes

#-- initialize(title, bonus_feat) ------------------------------------------------------#
#++	
	def initialize (title="", bonus_feat=false)
		@bonus_feat = bonus_feat
		@type = "general"
		@title =title
		@bonus_classes = []
	end
  
#-- self.available?(character) ---------------------------------------------------------#
#++
	def self.available?(character)
		return true
	end
  
#-- self.add(character) ----------------------------------------------------------------#
#++
	def self.add(character)
		character.feats.push(self.new)
		#Override this function to perform other operations or modifications on character.
		#Remember to include super(character) call
		#For some feats add Procs to character.level_procs, first_procs, and final_procs arrays.
	end
  
#-- to_s -------------------------------------------------------------------------------#
#++
	def to_s
		return title.to_s
	end

#-- self.feat_taken(char) --------------------------------------------------------------#
#++
	def self.feat_taken(char)
		return char.feats.collect{|feat| feat.title}.include?(self.new.title)
	end

#-- self.is_bonus_feat?(class_type) --------------------------------------------------------------#
#++
	def self.is_bonus_feat?(class_type)
		return @bonus_classes.include?(class_type)
	end
end