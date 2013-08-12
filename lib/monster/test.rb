require 'nokogiri'
doc = Nokogiri::Slop(File.read(File.dirname(__FILE__) + "/monster.xml"))
doc.monsters.monster.each do |mon|
  name = mon.at_xpath("name").content
  cr = mon.challenge_rating.content.to_i
  type = mon.at_xpath("type").content
  full_text = mon.full_text.inner_html.strip
  p full_text
end