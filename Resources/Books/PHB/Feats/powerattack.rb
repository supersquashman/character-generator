#require "FeatList"
# require 'pathname' 
# require Pathname(__FILE__).ascend{|d| h=d+'FeatList.rb'; break h if h.file?} 
class PowerAttack < FeatModel
	def initialize 
		super
		@title = "Power Attack"
		@tag = "Fighter"
		@description = "You make a power attack"
		@page = "PHB??"
		@link = ""
		@ftr=true
	end
	def self.available?(char)
		return !char.feats.feats.include?(self.new) && char.stats["str"] >= 13
	end
end
FeatList.push(PowerAttack)