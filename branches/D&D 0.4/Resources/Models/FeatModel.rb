
class FeatModel
	attr_accessor :title,:description,:page,:type,:link,:bonus_feat, :bonus_classes
	
	def initialize (title="", bonus_feat=false)
		@bonus_feat = bonus_feat
		@type = "general"
		@title =title
		@bonus_classes = []
	end
	
	def self.available?(character)
		return true
	end
	
	def self.add(character)
		character.feats.push(self.new)
		#Override this function to perform other operations or modifications on character.
		#Remember to include super(character) call
		#For some feats add Procs to character.level_procs, first_procs, and final_procs arrays.
	end
	
	def to_s
		return title.to_s
	end
  def self.feat_taken(char)
    return char.feats.collect{|feat| feat.title}.include?(self.new.title)
  end
end