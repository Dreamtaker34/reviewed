class TvShowsController < ApplicationController

  def index
    Tmdb::Api.key(ENV["movie_db_key"])
    @popular = Tmdb::TV.popular
  end
end
