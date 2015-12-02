require 'rubygems'
require 'sinatra'
require 'sinatra/minify'
require 'rack/contrib'
require 'yaml'
require 'haml'
require 'mail'
require 'pry'
require File.expand_path(File.dirname(__FILE__) + '/lib/helpers/html')
EMAIL_CONFIG = File.expand_path(File.dirname(__FILE__) + '/config/email.yml')
if File.exists?(EMAIL_CONFIG)
  YAML.load_file(EMAIL_CONFIG).each do |key, value|
    ENV[key] = value
  end
end


Mail.defaults do
  delivery_method :smtp, { :address   => 'smtp.sendgrid.net',
                           :port      => '587',
                           :domain    => 'hogstock.com',
                           :user_name => ENV['sendgrid_username'],
                           :password  => ENV['sendgrid_password'],
                           :authentication => 'plain',
                           :enable_starttls_auto => true }
end

#require_relative 1.8 workaround
unless Kernel.respond_to?(:require_relative)
  module Kernel
    def require_relative(path)
      require File.join(File.dirname(caller[0]), path.to_str)
    end
  end
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

  before do
    expires 5001, :public_folder, :must_revalidate
  end
end
