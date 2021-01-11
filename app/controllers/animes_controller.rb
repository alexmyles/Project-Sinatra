class AnimesController < ApplicationController
    get '/animes' do
        redirect_if_not_logged_in
        @animes = Anime.all
        erb :'animes/index'
    end
   
    get '/animes/new' do
        erb :'animes/new'
    end

    post '/animes' do
        anime = current_user.anime.build(params[:anime])

        if anime.save
            redirect '/animes'

        else
            redirect '/animes/new'
        end
    end

    get '/animes/:id' do 
        find_anime
        erb :'animes/show'
    end

    private

    def find_anime
        @anime = Anime.find_by_id(params[:id])
    end
end 