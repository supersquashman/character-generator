# Languages - Manager of D&D Languages[String]
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

require_relative "#{File.dirname(__FILE__)}/LanguageList"

#--== Languages ========================================================================#
#++
class Languages
	def initialize
		LanguageList.load_langs(
		["Abyssal",
		"Aquan",
		"Auran",
		"Celestial",
		"Common",
		"Draconic",
		#"Druidic",
		"Dwarven",
		"Elven",
		"Giant",
		"Gnome",
		"Goblin",
		"Gnoll",
		"Halfling",
		"Ignan",
		"Infernal",
		"Orc",
		"Sylvan",
		"Terran",
		"Undercommon"])

		#-------------------------Custom Language------------------
		#Format for adding new languages:   LanguageList.load_langs(langs=[])   *optional
	end
end