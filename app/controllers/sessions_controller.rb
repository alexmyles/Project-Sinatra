class SessionsController < ApplicationController
    get'/signup' do
        redirect_if_logged_in
        erb :'sessions/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect "/animes"
        else
            redirect "/signup"
        end
    end
    get "/login" do
        redirect_if_logged_in
        erb :'sessions/login'
    end

    post "/login" do
        user = User.find_by_username(params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/animes"
        else
            redirect "/login"

        end
    end

    get '/logout' do
        
        session.clear
        redirect "/"
    end
end