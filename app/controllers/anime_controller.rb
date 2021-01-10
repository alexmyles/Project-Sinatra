class AnimeController < ApplicationController
    get'/anime' do
        @anime = Anime.all
        erb :anime/index
    end
end