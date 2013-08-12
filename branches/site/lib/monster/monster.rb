require 'nokogiri'
require 'csv'
require 'mongo_mapper'


class Monster
  include MongoMapper::Document

  key :name, String
  key :full_text, String
  key :cr, Integer
  key :type, String
  key :source, String
  key :monster_id, String
  
  def self.load_sources
    # Monster.destroy_all

    if Monster.where(:source=>"SRD").count < 10
      puts "Loading SRD Monsters"

      doc = Nokogiri::Slop(File.read(File.dirname(__FILE__) + "/monster.xml"))
      doc.encoding = 'UTF-8'
      id = Monster.count || 0
      doc.monsters.monster.each do |mon|
        name = mon.at_xpath("name").content
        cr = mon.challenge_rating.content.to_i
        type = mon.at_xpath("type").content
        full_text = mon.full_text.inner_html.strip
        id+=1
        Monster.new(:name=>name, :cr=>cr, :type=>type, :full_text=>full_text, :source=>"SRD",:monster_id=>id.to_s).save
      end
    end

    if Monster.where(:source=>"PFSRD").count < 10
      puts "Loading PFSRD Monsters"
      id = Monster.count || 0
      doc = CSV.foreach(File.dirname(__FILE__) + "/pfmonster.csv", {:headers=>true}) do |mon|
        name = mon["Name"]
        cr = mon["CR"].to_i
        type = mon["Type"]
        full_text = mon["FullText"]
        id+=1
        Monster.new(:name=>name, :cr=>cr, :type=>type, :full_text=>full_text, :source=>"PFSRD",:monster_id=>id.to_s).save
      end
    end
  end
  
end


