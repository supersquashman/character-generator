require_relative "../Models/FeatModel"
#require './Dice'
class FeatList
	@@list=Hash.new
	attr_accessor :feats
	def initialize 
		@feats = []
	end
	def list
		return @@list
	end
	def self.push(fea)
		@@list[fea.to_s] = fea
	end
	def self.list
		return @@list
	end
	def roll_feats(char, num, restriction=[])
		num.times do 
			available = available_feats(char,restriction)
			if(available.length >0)
				t=rand(available.length)
        available[t].add(char)
				#feats.push(available[t].new)
			else
				feats.push(FeatModel.new("Additional Feat"))
			end
		end
	end
	def available_feats (char , restriction=[])
		available = []
		list.each do |title,feat|
			if feat.available?(char)
				#prefered.include?(feat.new.title) ? [prefer,1].max.times { available.push(feat)} :[new,1].max.times{available.push(feat)}
				restriction.length<1 || restriction.include?(feat.new.title) ? available.push(feat) : 0
			end
		end
		return available
	end
	def to_s
		ret =""
		feats.each {|feat| ret+="\t* "+feat.title.to_s+"\n" }
		return ret
	end
end

