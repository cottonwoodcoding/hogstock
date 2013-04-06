class Hogstock < Sinatra::Application
  get '/' do
    haml :index
  end

  get '/home' do
    haml :home
  end 

  get '/menu' do
    haml :menu
  end

  get '/photos' do
    haml :photos
  end

  get '/contact' do
    haml :contact
  end

  get '/testimonials' do
    haml :testimonials
  end

  get '/content' do
    haml :content
  end
end
