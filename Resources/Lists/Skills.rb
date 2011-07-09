require_relative "SkillList"
require_relative "../Models/SkillModel"

class Skills
	def initialize
		SkillList.load_skills( 
		[["Appraise","int"],
		["Balance","dex",true],
		["Bluff","cha"],
		["Climb","str",true,],
		["Concentration","con"],
		["Craft","int"],
		["Decipher Script","int"],
		["Diplomacy","cha"],
		["Disable Device","int"],
		["Disguise","cha"],
		["Escape Artist","dex",true],
		["Forgery","int"],
		["Gather Information","cha"],
		["Handle Animal","cha"],
		["Heal","wis"],
		["Hide","dex",true],
		["Intimidate","cha"],
		["Jump","str",true],
		#["Knowledge","int"], #Knowledge skills added below
		["Listen","wis"],
		["Move Silently","dex",true],
		["Open Lock","dex"],
		["Perform","cha"],
		["Profession","wis"], #each profession?
		["Ride","dex"],
		["Search","int"],
		["Sense Motive","wis"],
		["Sleight of Hand","dex",true],
		["Speak Language","none"], #should add language to character
		["Spellcraft","int"],
		["Spot","wis"],
		["Survival","wis"],
		["Swim","str",true], #double armorcheck penalties (Added in to_s method)
		["Tumble","dex",true],
		["Use Magic Device","cha"],
		["Use Rope","dex"]])
		knowledge = ["Military","Arcana","Architecture and Engineering","Dungeoneering","Geography","History","Local","Nature","Nobility and Royalty","Psionics","Religion","The Planes"]
		knowledge.each_index {|i| knowledge[i] = "Knowldege(" + knowledge[i] +")" }
		knowledge.each {|k| SkillList.push(SkillModel.new(k,"int"))}

		#-------------------------Custom Skill------------------
		#Format for adding new skills:   SkillList.load_skills(name, mod="<stat>",armor_check=<boolean>*, description=""*,restricted=[]*,ranks=0*)   *optional
	end
end