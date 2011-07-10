require_relative "../Models/RaceModel"
class RaceList
	@@list=Hash.new
	def list
		return @@list
	end
	def self.push(race)
		@@list[race.to_s] = race
	end
	def self.list
		return @@list
	end
end

def weighted_age(age, weight=Array.new(100,1)+Array.new(50,1)+Array.new(25,3)+Array.new(10,4)+Array.new(2,0.5))
	return (age*(weight [rand(weight.length)])).to_i
end

