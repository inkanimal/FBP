require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, 'password_security'
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    if logged_in?
      redirect to '/home'
    else
      erb :'users/signup'
   end
  end

  post '/signup' do
    if params[:username].empty? || params[:password].empty? || params[:email].empty?
      redirect '/signup'
    else
      user = User.new(username: params['username'], email: params['email'], password: params['password'])
      if user.save
        session[:user_id] = user.id
        redirect '/home'
     end
   end
  end

  get '/login' do
    if logged_in?
      redirect to '/home'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/home'
    else
      redirect to '/users/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/'
    else
      redirect to '/'
    end
  end

  get '/home' do
    if logged_in?
      @user = current_user
      @teams = Team.all
      erb :'teams/home'
    else
      redirect '/users/login'
    end
  end

  get '/teams/new' do
    if logged_in?
      @user = current_user
      erb :'teams/new'
    else
      redirect '/teams/login'
    end
  end

  post '/teams' do
    if logged_in?
     if params[:name].empty?
        redirect '/teams/new'
     end
        @user = current_user
        new_team = Team.new(name: params[:name], user: current_user)
     if new_team.save
        redirect '/home'
     end
    end
  end

  get '/teams/:id' do
     if logged_in?
      # binding.pry
       @user = current_user
       @team = current_team
       erb :'teams/show'
     else
       redirect '/users/login'
     end
   end

   get '/teams/:id/players' do
     if logged_in?
       @user = current_user
       @team = current_team
       @players = Player.all
       erb :'teams/players'
     else
       redirect '/users/login'
     end
   end

   patch '/teams/id' do
     if logged_in?
       @user = current_user
       @team = current_team
       @player = Player.find(params[:id])
       team = Team.create(params[:player])
       unless params[:player][:name].empty?
      team.players.create(params[:player])
    end

     redirect '/teams/#{@team.id}'
   end
 end




   delete '/teams/:id' do
      @team = current_team
      @user = current_user
     if @user.id == @team.user_id
        @team.destroy
        redirect  '/home'
     else
       redirect  '/home'
     end
   end






  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def current_team
      Team.find_by_id(params[:id])
    end
  end
end
