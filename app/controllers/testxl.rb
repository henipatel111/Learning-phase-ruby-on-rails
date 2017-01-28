puts "hello world"
puts "testing gem........."

require 'simple_xlsx_reader'

doc = ::xlsx(File.open("articlelist1.xlsx"))
doc.xpath('//character').each do

 |char_element|

 puts char_element.text

 end
