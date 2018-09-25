require "./config/environment"

class ApplicationController < Sinatra::Base

  configure
    enable :sessions
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    if logged_in?
      redirect to ''
    else
    erb :signup
  end
end

  post "/signup" do
    #your code here
      if params[:username].empty? || params[:password].empty? || params[:email].empty?
        redirect to '/signup'
      end
        user = User.new(:username => params[:username], :password => params[:password])
	    if user.save
        session[:user_id] = user.id
        redirect "/"
      end
    end
  end

  end

  get '/account' do
    @user = User.find(session[:user_id])
    erb :account
  end


  get "/login" do

    erb :login
  end

  post "/login" do
   user = User.find_by(:username => params[:username])

   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect "/account"
   else
     redirect "/"
   end
    ##your code here
  end


  get "/logout" do
    if logged_in?
    session.destroy
    redirect "/"
  else
    redirect '/'
  end
end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
