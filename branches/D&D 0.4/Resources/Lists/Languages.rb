require_relative "LanguageList"

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