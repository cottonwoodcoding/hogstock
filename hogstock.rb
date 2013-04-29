require 'rubygems'
require 'sinatra'
require 'sinatra/minify'
require 'rack/contrib'
require 'yaml'
require 'haml'
require 'mail'
require File.expand_path(File.dirname(__FILE__) + '/lib/helpers/html')
EMAIL = YAML.load_file(File.expand_path(File.dirname(__FILE__) + '/config/email.yml'))
Mail.defaults do
  delivery_method :smtp, { :address   => EMAIL['sendgrid']['address'],
                           :port      => EMAIL['sendgrid']['port'],
                           :domain    => EMAIL['sendgrid']['domain'],
                           :user_name => EMAIL['sendgrid']['username'],
                           :password  => EMAIL['sendgrid']['password'],
                           :authentication => EMAIL['sendgrid']['authentication'],
                           :enable_starttls_auto => EMAIL['sendgrid']['starttls_auto'] }
end

class Hogstock < Sinatra::Application
  register Sinatra::Minify
  helpers Sinatra::HtmlHelpers

  set :public_folder, 'public', File.dirname(__FILE__)
  set :root, 'app', File.dirname(__FILE__) 
  set :js_path, 'public/javascripts'
  set :js_url, '/javascripts'
  set :environment, :production

  require_relative 'app/routes/init'
end
