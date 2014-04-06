require 'sinatra'
require 'open-uri'
require 'nokogiri'
require 'erb'

get '/' do
  begin
    @doc = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt'))
  rescue OpenURI::HTTPError
    @doc = 404
  end
  if @doc != 404
    @status = @doc.xpath('//status')[7]
    @train_status = @status.to_s =~ /GOOD SERVICE/ ? 'nope' : 'yup'
  else
    @train_status = 'idk'
  end
  erb :index
end
