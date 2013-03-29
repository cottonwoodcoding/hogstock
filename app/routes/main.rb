class Hogstock < Sinatra::Application
  get '/' do
    haml :index
  end
end
