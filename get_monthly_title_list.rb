require 'nokogiri'
require 'open-uri'
#'http://www.getchu.com/all/month_title.html?genre=pc_soft&gage=&year=2015&month=02'
# file.html
file = ARGV[0]

doc = nil

f = File.open(file)
 doc = Nokogiri::XML(f, nil, 'EUC-JP')
f.close

#div class category_pc_b
#link_list = doc.search('a')

#link_list.each do |node|
#  puts node.text
#end

#/soft.phtml?id=
doc.xpath('//div[@class="category_pc_b"]').each do |node|
  link_list = doc.search('a')
  puts link_list.class

  link_list.each do | nc |
    puts nc.class
    puts nc.values
  end
  #title = link_list.text.gsub(/\t|\r|\n/, '')
  #puts title
end