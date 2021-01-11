class AnimesController < ApplicationController
    get '/animes' do
        redirect_if_not_logged_in
        @animes = Anime.all
        erb :'animes/index'
    end
end 