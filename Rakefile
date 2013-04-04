desc "Builds the minified CSS and JS assets."
task :minify do
  require './hogstock.rb'   # <= change this
  puts "Building..."

  files = Sinatra::Minify::Package.build(Hogstock)  # <= change this
  files.each { |f| puts " * #{File.basename f}" }
  puts "Construction complete!"
end
