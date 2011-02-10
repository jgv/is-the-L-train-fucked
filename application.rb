require 'sinatra'
require 'open-uri'
require 'nokogiri'


get '/' do
  @doc = Nokogiri::XML(open('http://mta.info/status/serviceStatus.txt'))  
  @names = @doc.xpath('//status')
  @names[7]
end
