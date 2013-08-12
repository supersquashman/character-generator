# LanguageList - Manager of D&D Languages[String]
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


require_relative "#{File.dirname(__FILE__)}/Languages"

#--== LanguageList ========================================================================#
#++
# Class lists available[static] D&D languages, character languages and provides functions for assignment and display

# Members :

# Methods :

class LanguageList
	@@list=[] #default languages available
  attr_accessor :bonus_languages #bonus languages the character has
	attr_accessor :languages #languages the character has
        
#-- initialize -------------------------------------------------------------------------#
#++
	def initialize
		Languages.new
		@languages=[]
    @bonus_languages=[]
		#everyone knows common
		learn_lang("Common")
	end
#-- list -------------------------------------------------------------------------------#
#++
	def list
		return @@list
	end
#-- self.push(skill) -------------------------------------------------------------------#
#++
	#add a language to the language list
	def self.push(language)
		@@list.push(language)
	end
#-- self.list --------------------------------------------------------------------------#
#++
	#return the list of languages available
	def self.list
		return @@list
	end
#-- learn_lang(language) ---------------------------------------------------------------#
#++
	#character learns a specific language
	def learn_lang(language, read=true)
		available =!languages.include?(language)
    to_read = language.include?("Speak Only") && !available
		if(available || to_read)
      if to_read || read
        languages.delete(language)
        languages.push(language.gsub(/\(Speak Only\)/,""))
      else
        languages.push(language + "(Speak Only)")
      end
			return true
		else
			return false
		end
	end
#-- self.load_langs(array) -------------------------------------------------------------#
#++
	def self.load_langs(array)      
		array.each do |lang|
			@@list.include?(lang) ? 0 : self.push(lang)
		end
	end
#-- roll_lang( bonus_langs=[]) -----------------------------------------------------#
#++
	def roll_lang(read=true)
		bonus_langs = bonus_languages - languages
		to_read = languages.uniq
		to_read.reject!{|lang| !lang.include?("Speak Only")}
		if to_read.length > 0
			learn_lang(to_read[rand(to_read.length)],read)
		elsif bonus_langs.length >0 
			learn_lang(bonus_langs[rand(bonus_langs.length)],read)
		elsif (list - languages).length >0
			while !learn_lang(list[rand(list.length)],read) ;end
		else
			#languages.push("Additional Language")
		return false
		end
    return true
	end
#-- to_s -------------------------------------------------------------------------------#
#++
	def to_s
		ret =""
		languages.each {|lang| ret += "    * " +lang +"\n"}
		return ret
	end
end