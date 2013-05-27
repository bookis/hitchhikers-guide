require 'nokogiri'
require "open-uri"

class WikiPage
  attr_accessor :html
  def initialize(url)
    begin
      doc = Nokogiri::HTML(open(url)).at_css("#content")
      doc.css("a").each do |link|
        link.attributes["href"].value = link.attributes["href"].value.gsub("wiki/", "") if link.attributes["href"]
      end
    
      doc.css(".mw-editsection").each(&:remove)
      doc.css("#jump-to-nav").each(&:remove)
    
      @html = doc.children.to_html
    rescue URI::InvalidURIError, OpenURI::HTTPError, "404 Not Found"
      @html = nil
    end
  end
end