require_relative "../Models/ClassModel"

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