require_relative "../Lists/SpellList"
class SpellModel
attr_accessor :name, :description, :page, :type, :link
@@all_spells = Hash.new(Hash.new([]))
def self.all_spells
  @@all_spells
end
def self.all_spells=(val)
  @@all_spells = val
end
def initialize(name = "", type = "",page = "N/A",description = "None", link = "")
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
end
require_relative "../Books/PHB/Magic/Spells/BardSpells"