require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'erb'

get '/' do
  @doc = Nokogiri::XML(open('http://mta.info/status/serviceStatus.txt'))  
  @status = @doc.xpath('//status')[7]
  erb :index
end
