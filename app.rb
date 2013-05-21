require 'sinatra'
require 'nokogiri'
require "open-uri"

class HitchWikiApp < Sinatra::Base
  get '/*' do
    url = "http://en.wikipedia.org/#{params[:splat][0]}"
    @html = Nokogiri::HTML(open(url)).at_css("#content").to_html
    erb :index
  end
end