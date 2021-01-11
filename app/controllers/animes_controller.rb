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
        redirect_if_not_exist
        erb :'animes/show'
    end

    get '/animes/:id/edit' do
        find_anime
        redirect_if_not_exist
        redirect_if_not_owner
        erb :'animes/edit'
    end

    patch '/animes/:id' do 
        find_anime
        if @anime.update(params[:anime])
           redirect "/animes/#{@anime.id}" 
        else
            redirect "/animes/new"
        end
    end

    delete '/animes/:id' do
        find_anime
        redirect_if_not_exist
        @anime.destroy
        redirect "/animes"
    end
    private

    def find_anime
        @anime = Anime.find_by_id(params[:id])
    end

    def redirect_if_not_owner
        redirect "/animes" unless @anime.user == current_user
    end

    def redirect_if_not_exist
        redirect "/animes" unless @anime
    end
end 