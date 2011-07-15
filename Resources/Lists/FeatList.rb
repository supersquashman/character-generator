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
	
	def self.roll_feats(char, num, restriction=[])
		num.times do 
			available = available_feats(char,restriction)
			if(available.length >0)
				t=rand(available.length)
				available[t].add(char)
				#feats.push(available[t].new)
			else
				char.feats.push(FeatModel.new("Additional Feat"))
			end
		end
	end
	
	def self.available_feats (char , restriction=[])
		available = []
		list.each do |title,feat|
			if feat.available?(char)
				#prefered.include?(feat.new.title) ? [prefer,1].max.times { available.push(feat)} :[new,1].max.times{available.push(feat)}
				restriction.length<1 || restriction.include?(feat.new.title) ? available.push(feat) : 0
			end
		end
		return available
	end
	
	def self.get_bonus_feat(char, class_type)
		available = available_feats(char)
		if(available.length >0)
			feat_added = false
			while (!feat_added && available.length >0)
				t=rand(available.length)
				if (available[t].is_bonus_feat?(class_type.downcase)) #&& !char.feats.contains?(available[t]))	
					available[t].add(char)
					feat_added = true
				else
					available.slice!(t)
				end
			end
			if !feat_added
				char.feats.push(FeatModel.new("Additional " + class_type +"Bonus Feat"))
			end
			#feats.push(available[t].new)
		else
			char.feats.push(FeatModel.new("Additional " + class_type +" Bonus Feat"))
		end
	end
	
	def to_s
		ret =""
		feats.each {|feat| ret+="\t* "+feat.title.to_s+"\n" }
		return ret
	end
end

