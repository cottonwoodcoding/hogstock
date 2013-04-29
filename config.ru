require File.expand_path(File.dirname(__FILE__) + '/hogstock')

use Rack::StaticCache, :urls => ["/images"], :root => Dir.pwd + '/public'
use Rack::Deflater
run Hogstock.new
