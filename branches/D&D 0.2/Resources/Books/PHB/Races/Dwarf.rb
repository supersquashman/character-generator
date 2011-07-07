#require "RaceList"
require 'pathname' 
require Pathname(__FILE__).ascend{|d| h=d+'Lists.rb'; break h if h.file?} 
class Dwarf
	def self.apply(char)
		age = 40
		(1..7).each do |i|
			age += (rand(6)+1)
		end
		char.race= self
		char.speed =20
		char.age = age#agew(7.d6+40)
		char.stats["con"] += 2
		char.stats["cha"] -= 2
	end
end
RaceList.push(Dwarf)