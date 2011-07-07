class RaceList
	@@RaceList=Hash.new
	def RaceList
		return @@RaceList
	end
	def self.push(race)
		@@RaceList[race.to_s] = race
	end
	def self.list
		return @@RaceList
	end
end

class ClassList
	@@list=Hash.new
	def list
		return @@list
	end
	def self.push(classs)
		@@list[classs.to_s] = classs
	end
	def self.list
		return @@list
	end
end


=begin
class CharRace
	attr_accessor :attr_mod, :size, :speed, :favored_class, :languages, :bonus_languages
	
	def self.apply(character)
		character.race= self
	end
end
=end
