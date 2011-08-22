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


#require "#{File.dirname(__FILE__)}/../Models/SpellModel"

#--== SpellList ========================================================================#
#++
# Class lists available[static] D&D spells, character spells and provides functions for assignment and display

# Members :

# Methods :

class SpellList
	@@list=Hash.new(Hash.new([])) #list of all spells (primary key is class)
  @@granted_powers_list = Hash.new() #list of granted powers description (primary key is domain)
  @@granted_powers_procs = Hash.new(Proc.new{|character|}) #Procedures the granted powers preform on the character.
  #following attributes have a shared keys of level/domain/category
	attr_accessor :known #spells known/memorized by character by level/domain/category 
	attr_accessor :book #spells known (by character by level/domain/category) in total by character (if not spontaneous caster)
  attr_accessor :per_day #spells of a category per day
  attr_accessor :forbidden_types
  attr_accessor :granted_powers
  attr_accessor :domains_known
        
#-- initialize(character)---------------------------------------------------------------#
#++
	def initialize

    @forbidden_types = Hash.new([])
		@known=Hash.new(Hash.new([]))
		@book=Hash.new(Hash.new([]))
    @per_day = Hash.new(Hash.new(-1))
    @granted_powers = Hash.new("")
    @domains_known = []
		#classes should load relavent spells
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
#-- roll_domains(character,number=2) ---------------------------------------------------#
def roll_domains(character, number=2, char_class="Cleric")
  forbidden_domains = {"Chaotic Good"=>["Law Domain","Evil Domain"],
  "Neutral Good"=>["Evil Domain"],
  "Lawful Good"=>["Chaos Domain","Evil Domain"],
  "Chaotic Neutral"=>["Law Domain"],
  "Neutral"=>[],
  "Lawful Neutral"=>["Chaos Domain"],
  "Chaotic Evil"=>["Law Domain","Good Domain"],
  "Neutral Evil"=>["Good Domain"],
  "Lawful Evil"=>["Chaos Domain","Good Domain"]}
  if(domains_known.length < number)
    domains = @@list[char_class].reject{|cat| !cat.include?("Domain")}.keys - forbidden_domains[character.alignment]
    [number, domains.length].min.times do 
      choices = domains - domains_known
      domain = choices[rand(choices.length)]
      @domains_known += [domain]
      @granted_powers[domain] = @@granted_powers_list[domain]
      if @known[char_class][domain].length < 1
        known[char_class] = Hash.new([]) if known[char_class].length <= 0 
        known[char_class][domain] = Array.new(9) 
      end
    end
  end
end
#-- roll_domain_spells(level, domains, number) -----------------------------------------#
def roll_domain_spells(level=1, domains=domains_known,number=1,char_class="Cleric")
  spells_known_level = 0
  domains.each do |domain|
    known[char_class][domain] = Array.new(9) if known[char_class][domain].length < 1
    spells_known_level += 1 if known[char_class][domain][level-1]
  end
  (number - spells_known_level).times do
    begin
    domain = domains[rand(domains.length)]
    choice = @@list[char_class][domain][level-1]
    end while !choice
    known[char_class] = Hash.new([]) if known[char_class].length <= 0     
    known[char_class][domain][level-1] = choice.dup
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
        list_dup.delete(choice.name) if !duplicates
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
        spell_list.keys.reject{|key| key.is_numeric?}.each do |spell_level|
          ret += spell_class + " " + spell_level.to_s + ":\n"
          ret += "Granted Powers: " + granted_powers[spell_level] + "\n"
          spell_list[spell_level].each_index do |i|
            if spell_list[spell_level][i].is_a?(SpellModel)
              ret += " " + (i+1).to_s + ") " + spell_list[spell_level][i].name + " (" + spell_list[spell_level][i].page +
              ") - " + spell_list[spell_level][i].description + "\n"
            end
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
#-- self.granted_powers_list -----------------------------------------------------------#
#++
	def self.granted_powers_list=(gpl)
		@@granted_powers_list = gpl
	end
#-- self.granted_powers_list -----------------------------------------------------------#
#++
	def self.granted_powers_list
		return @@granted_powers_list
	end
#-- self.granted_powers_procs ----------------------------------------------------------#
#++
	def self.granted_powers_procs=(gpp)
		@@granted_powers_procs = gpp
	end
#-- self.granted_powers_list -----------------------------------------------------------#
#++
	def self.granted_powers_procs
		return @@granted_powers_procs
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