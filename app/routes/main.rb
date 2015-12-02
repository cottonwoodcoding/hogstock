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

  post '/contact' do
    contact_name = params[:contact_name]
    contact_mail = params[:contact_mail]
    contact_body = params[:contact_body]
    mail = Mail.deliver do
      to ENV['emails']
      from contact_mail
      subject "#{contact_name} has a question about Hogstock"
      html_part do
        body contact_body
      end
    end 
  "Email has been sent! Thank you, we will get back to you as soon as possible."
  end
end
