require 'rubygems'
require 'sinatra'
require 'sinatra/minify'
require 'rack/contrib'
require 'yaml'
require File.expand_path(File.dirname(__FILE__) + '/hogstock')

use Rack::StaticCache, :urls => ["/images"], :root => Dir.pwd + '/public'
run Hogstock.new
