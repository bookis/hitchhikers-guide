require 'sinatra'
require './lib/wiki_page'
class HitchWikiApp < Sinatra::Base
  
  get "/guide-search" do
    redirect to("/#{params[:q].gsub(' ', '_')}")
  end
  
  get '/*' do
    doc = WikiPage.new("http://en.wikipedia.org/wiki/#{params[:splat][0]}")
    if doc.html
      @html = doc.html
      erb :index
    else
      halt 404
    end
  end
  
  not_found do
    erb :'404'
  end
end