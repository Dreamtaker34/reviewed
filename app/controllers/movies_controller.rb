class MoviesController < ApplicationController

  def index
    Tmdb::Api.key(ENV["movie_db_key"])
    @playing = Tmdb::Movie.now_playing
    @upcoming = Tmdb::Movie.upcoming
  end

end
