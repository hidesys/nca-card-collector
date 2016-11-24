require 'rubygems'
require 'mechanize'
require 'forwardable'
require 'uri'
require 'yaml'

PREF_DIR = "prefs/"
KARTE_DIR = "kartes/"

agent = Mechanize.new
agent.user_agent_alias = "Windows IE 7"
agent.max_history = 1

(1..47).each do |pref_id|
  pref_path = PREF_DIR + pref_id.to_s + ".html"
  if File.exists?(pref_path)
    next
  end
  url = "http://www.nca.or.jp/card/view/cities/pref/" + sprintf("%02d", pref_id)
  page = agent.get(url)
  File.open(pref_path, "w") do |f|
    f.write page.body.force_encoding("UTF-8")
  end
end

karte_list = []
Dir.glob(PREF_DIR + "*.html").each do |pref_path|
  html_str = nil
  File.open(pref_path, "r") do |f|
    html_str = f.read
  end
  doc = Nokogiri.HTML(html_str)
  list = doc.search("//a").map{|xml| xml["href"] =~ /karte\/city\/(\d+)$/ && $1}
  list.compact!
  karte_list += list
end

karte_list.each do |karte_id|
  karte_path = KARTE_DIR + karte_id + ".html"
  if File.exists?(karte_path)
    next
  end
  url = "http://www.nca.or.jp/card/view/karte/city/#{karte_id}"
  puts "get: #{url}"
  sleep 0.5
  page = agent.get(url)
  File.open(karte_path, "w") do |f|
    f.write page.body.force_encoding("UTF-8")
  end
end



