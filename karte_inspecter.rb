require "nokogiri"
require "csv"

KARTE_DIR = "kartes/"
KARTE_CONFIG = "karte.conf"
OUTPUT_PATH = "inkai.csv"

config_str = nil
File.open(KARTE_CONFIG, "r") do |f|
  config_str = f.read
end
config = {}
config_str.split(/(\n\r|\n|\r)/).each do |line|
  line_splitted = line.split("\t")
  config[line_splitted[0]] = line_splitted[1]
end

csv_str = CSV.generate do |csv|
  csv << config.keys
  Dir.glob(KARTE_DIR + "*.html").each do |karte_path|
    html_str = File.open(karte_path, "r").read
    doc = Nokogiri.HTML(html_str)
    values = []
    config.each do |key, xpath|
      values << doc.xpath(xpath).inner_text.strip
    end
    csv << values
  end
end

File.open(OUTPUT_PATH, "wb") do |f|
  f.write csv_str.encode(
    Encoding::SJIS,
    :invalid => :replace,
    :undef => :replace,
    :replace => "")
end


