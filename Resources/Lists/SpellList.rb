# SpellList - Manager of D&D spells[SpellModel], spell generation and container for related methods
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


require_relative "../Models/SpellModel"

#--== SpellList ========================================================================#
#++
# Class lists available[static] D&D spells, character spells and provides functions for assignment and display

# Members :

# Methods :

class SpellList
	@@list=Hash.new(Hash.new([])) #list of all spells (primary key is class)
  #following attributes have a shared keys of level/domain/category
	attr_accessor :known #spells known/memorized by character by level/domain/category 
	attr_accessor :book #spells known (by character by level/domain/category) in total by character (if not spontaneous caster)
  attr_accessor :per_day #spells of a category per day
  attr_accessor :forbidden_types
        
#-- initialize(character)---------------------------------------------------------------#
#++
	def initialize

    @forbidden_types = Hash.new([])
		@known=Hash.new(Hash.new([]))
		@book=Hash.new(Hash.new([]))
    @per_day = Hash.new(Hash.new(-1))
		#load all spells lists here?
		#spelldirectories.each {|spell| require spell}
	end
#-- list -------------------------------------------------------------------------------#
#++
	def list
		return @@list
	end
#-- self.push(spell) -------------------------------------------------------------------#
#++
	#add spell to the spell list
	def self.push(spell, category, char_class)
    @@list[char_class] = Hash.new([]) if @@list[char_class].length <= 0 
    @@list[char_class][category] = [] if @@list[char_class][category].length <= 0 
    @@list[char_class][category].push(spell)
	end
#-- self.list --------------------------------------------------------------------------#
#++
	#return the list of spells available
	def self.list
		return @@list
	end
#-- self.load_spells(array) ------------------------------------------------------------#
#++
  def self.load_spells(category, char_class, spells=[][])
    spells.each do |spell|
      eval('self.push(SpellModel.new("' + spell.join('","') + '"),"' + category.to_s + '","' + char_class.to_s + '")')
    end
  end
#-- roll_spell_book(number, category, char_class, for_book=false) ----------------------#
#++
	def roll_spell_book(number, category, char_class) 
    (number-known[char_class][category].length).times do
      book[char_class] = Hash.new([]) if book[char_class].length <= 0 
      list_dup = @@list[char_class][category].uniq
      list_dup.reject!{|v| book[char_class][category].include?(v)}
      begin
      choice = list_dup[rand(list_dup.length)]
      choice = SpellModel.new(char_class.to_s + " Spell") if !choice
      list_dup.delete(choice)
      if !choice.available(forbidden_types[char_class])
        choice = nil
      end
      end while !choice
      book[char_class][category] += [choice].dup
    end
	end
#-- roll_spells(number, category, char_class, for_book=false) --------------------------#
#++
	def roll_spells(number, category, char_class, duplicates=false) 
    (number-known[char_class][category].length).times do
      if book[char_class][category].length <=0
        known[char_class] = Hash.new([]) if known[char_class].length <= 0 
        list_dup = @@list[char_class][category].uniq
        list_dup.reject!{|v| known[char_class][category].include?(v)} if !duplicates
        begin
        choice = list_dup[rand(list_dup.length)]
        choice = SpellModel.new(char_class.to_s + " Spell") if !choice
        list_dup.delete(choice.name) 
        if !choice.available(forbidden_types[char_class])
          choice = nil
        end
        end while !choice
        known[char_class][category] += [choice].dup
      else
        known[char_class] = Hash.new([]) if known[char_class].length <= 0 
        choice = book[char_class][category][rand(book[char_class][category].length)]
        choice = SpellModel.new(char_class.to_s + " Spell") if !choice
        known[char_class][category] += [choice].dup
      end
    end
	end
#-- set_spells_per_day(number, category, char_class) -----------------------------------#
#++
	def set_spells_per_day(number, category, char_class)
    per_day[char_class] = Hash.new(-1) if per_day[char_class].length <= 0 
    per_day[char_class][category] = number
	end
#-- to_s -------------------------------------------------------------------------------#
#++
	def to_s
    if known.length > 0
      ret = "\n"
      known.each do |spell_class, spell_list|
        spell_list.keys.reject{|key| !key.is_numeric?}.each do |spell_level|
          spells_per_day = ""
          if per_day[spell_class][spell_level] > 0
            spells_per_day = " (" + per_day[spell_class][spell_level].to_s + "/ Day)"
          end
          ret += "Level " + spell_level.to_s + " " + spell_class + " Spells" + spells_per_day + ":\n"
          spell_list[spell_level].each do |spell|
            ret += " * "+spell.name + " (" + spell.page + ") - " + spell.description + "\n"
          end
          ret += "\n"
        end
      end
    end
    ret
  end
#-- self.bonus_spells ------------------------------------------------------------------#
#++
def self.bonus_spells(stat_bonus=0, spell_level=0)
  bonus = 0
  bonus = ((stat_bonus - spell_level + 1.0) / 4.0).ceil if spell_level > 0
  return [bonus,0].max
end
#-- self.table_row ---------------------------------------------------------------------#
#++
def self.table_row(table =[][], row=0)
  if table.length > row
    table[row].each_index do |i|
      yield table[row][i], i
    end
  end
end
end
#monkey code for determining if a string is a number
class String
  def is_numeric?
    Float(self)
    true 
  rescue 
    false
  end
end