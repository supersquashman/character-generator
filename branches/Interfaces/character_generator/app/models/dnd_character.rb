class DndCharacter < ActiveRecord::Base
  validates_numericality_of :seed
  validates_length_of :seed, :maximum => 19
end
