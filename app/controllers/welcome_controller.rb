class WelcomeController < ApplicationController
  def index

  end

  def search

    Tmdb::Api.key(ENV["movie_db_key"])
    @movies = Tmdb::Movie.find(params[:q])

    render :index

  end

end
