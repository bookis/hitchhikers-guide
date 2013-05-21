require 'sinatra'
require 'nokogiri'
require "open-uri"

class HitchWikiApp < Sinatra::Base
  
  get "/guide-search" do
    redirect to("/#{params[:q].gsub(' ', '_')}")
  end
  
  get '/*' do
    url = "http://en.wikipedia.org/wiki/"
    url += params[:splat][0]
    begin
      doc = Nokogiri::HTML(open(url)).at_css("#content")
    rescue OpenURI::HTTPError, "404 Not Found"
      halt 404
    end
      
    halt 404 unless doc
    doc.css("a").each do |link|
      link.attributes["href"].value = link.attributes["href"].value.gsub("wiki/", "") if link.attributes["href"]
    end
    
    doc.css(".mw-editsection").each(&:remove)
    doc.css("#jump-to-nav").each(&:remove)
    
    @html = doc.children.to_html
    erb :index
  end
  
  not_found do
    erb :'404'
  end
end