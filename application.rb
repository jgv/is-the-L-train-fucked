require 'sinatra'
require 'open-uri'
require 'nokogiri'


get '/' do
  doc = Nokogiri::XML(open('http://mta.info/status/serviceStatus.txt'))  
  doc.xpath('//line/name').to_s
end
