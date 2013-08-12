# SkillModel - Model of D&D spells and container for related information
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

require "#{File.dirname(__FILE__)}/../Lists/SpellList"

#--== SkillModel =======================================================================#
#++
class SpellModel
attr_accessor :name, :description, :page, :type, :link
@@all_spells = Hash.new(Hash.new([]))

#-- self.all_spells --------------------------------------------------------------------#
#++
def self.all_spells
  @@all_spells
end

#-- self.all_spells=(val) --------------------------------------------------------------#
#++
def self.all_spells=(val)
  @@all_spells = val
end

#-- initialize(name, type, page, description, link) ------------------------------------#
#++
def initialize(name = "", type = "",page = "N/A",description = "None", link = "")
  @name = name
  @type = type
  @page = page
  @description = description
  @link = link
end

#-- available(forbidden_spells) --------------------------------------------------------#
#++
def available(forbidden_spells)
  forbidden = false
  forbidden_spells.each { |stype| forbidden ||= @type.include?(stype)}
  return !forbidden
end

#-- ==(other) --------------------------------------------------------------------------#
#++
def ==(other)
  if other.is_a?(SpellModel)
    return other.name == @name
  else
    return other == @name
  end
end
end