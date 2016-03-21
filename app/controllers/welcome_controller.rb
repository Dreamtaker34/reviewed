class WelcomeController < ApplicationController
  def index
    @movies = []
    @shows = []
    @random = [Movie.all.sample.title, Tvshow.all.sample.name].sample

  end

  def search

    Tmdb::Api.key(ENV["movie_db_key"])
    @movies = Tmdb::Movie.find(params[:q])
    @tv_shows = Tmdb::TV.find(params[:q])

    render :index

  end

end
