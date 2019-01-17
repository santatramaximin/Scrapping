#! /usr/bin/env ruby


=begin
# Fetch and parse HTML document
doc = Nokogiri::HTML(open('http://www.nokogiri.org/tutorials/installing_nokogiri.html'))

puts "### Search for nodes by css"
doc.css('nav ul.menu li a', 'article h2').each do |link|
  puts link.content
end

puts "### Search for nodes by xpath"
doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
  puts link.content
end

puts "### Or mix and match."
doc.search('nav ul.menu li a', '//article//h2').each do |link|
  puts link.content
end
=end


require 'nokogiri'
require 'open-uri'


symbol =[]
price = []



page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
page.xpath('//*[@class="text-left col-symbol"]').each do |f|
	symbol << f.text 
end

page.xpath('//*[@class="price"]').each do |z|
	price << z.text 
end

h = Hash[symbol.zip(price.map {|i| i.include?(',') ? (i.split /,/) : i})]

puts h 



