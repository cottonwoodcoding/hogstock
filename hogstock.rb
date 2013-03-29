require File.expand_path(File.dirname(__FILE__) + '/lib/helpers/html')

class Hogstock < Sinatra::Application
  register Sinatra::Minify
  helpers Sinatra::HtmlHelpers

  set :public_folder, 'public', File.dirname(__FILE__)
  set :root, 'app', File.dirname(__FILE__) 
  set :js_path, 'public/javascripts'
  set :js_url, '/javascripts'

  require_relative 'lib/init'
  require_relative 'app/routes/init'
end
