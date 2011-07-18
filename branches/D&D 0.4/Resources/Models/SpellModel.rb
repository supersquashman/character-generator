
class SpellModel
attr_accessor :name, :description, :page, :type, :link
@@all_spells = Hash.new(Hash.new([]))
def self.all_spells
  @@all_spells
end
def self.all_spells=(val)
  @@all_spells = val
end
def initialize(name = "", type = "",page = "",description = "", link = "")
  @name = name
  @type = type
  @page = page
  @description = description
  @link = link
end
def available(character)
  forbidden = false
  character.forbidden_spell_types.each { |stype| forbidden ||= @type.include?(stype)}
  return !forbidden
end
def self.spell_level(spells=[][])
  spell_array = []
  spells.each do |spell|
    eval('spell_array.push(SpellModel.new("' + spell.join('","') + '"))')
  end
  return spell_array
end
def self.learn_spells
end
require_relative "../Books/PHB/Magic/Spells/BardSpells"