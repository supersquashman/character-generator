
require Pathname(__FILE__).ascend{|d| h=d+'Lists.rb'; break h if h.file?} 
class Human
	def self.apply(char)
		age = 15
		(1..2).each do |i|
			age += (rand(6)+1)
		end
		char.race= self
		char.speed = 30
		char.age = age#agew(7.d6+40)
	end
end
RaceList.push(Human)