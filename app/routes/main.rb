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

  post '/content' do
    mail = Mail.deliver do
      to EMAIL['sendgrid']['emails']
      from params[:mail]
      subject "#{params[:name]} has a question about Hogstock"
      html_part do
        body params[:body]
      end
    end 
  "Email has been sent! Thank you, we will get back to you as soon as possible."
  end
end
