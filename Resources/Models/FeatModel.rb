
class FeatModel
	attr_accessor :title,:description,:page,:type,:link,:ftr
	def initialize (title="", ftr=false)
		@ftr = ftr
		@type = "general"
		@title =title
	end
	def self.available?(character)
		return true
	end
	def self.add(character)
		character.feats.feats.push(self.new)
		#Override this function to perform other operations or modifications on character.
		#Remember to include super(character) call
		#For some feats add Procs to character.level_procs, first_procs, and final_procs arrays.
	end
end