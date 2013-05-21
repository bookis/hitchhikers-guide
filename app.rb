require 'sinatra'
require 'nokogiri'
require "open-uri"

class HitchWikiApp < Sinatra::Base
  get '/*' do
    url = "http://en.wikipedia.org/wiki/"
    url += params[:splat][0]
    doc = Nokogiri::HTML(open(url)).at_css("#content")
    halt 404 unless doc
    doc.css("a").each do |link|
      puts link.text.inspect
      link.attributes["href"].value = link.attributes["href"].value.gsub("wiki/", "") if link.attributes["href"]
    end
    
    doc.css(".mw-editsection").each(&:remove)
    
    @html = doc.children.to_html
    erb :index
  end
  
  not_found do
    erb :'404'
  end
end