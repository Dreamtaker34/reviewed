class WelcomeController < ApplicationController
  def index
    @movies = []
    @shows = []
  end

  def show
    Tmdb::Api.key(ENV["movie_db_key"])
    @movie = Tmdb::Movie.detail(params[:id])

    render :show

  end

  def search

    Tmdb::Api.key(ENV["movie_db_key"])
    @movies = Tmdb::Movie.find(params[:q])
    @tv_shows = Tmdb::TV.find(params[:q])

    render :index

  end

  def tv_search

    Tmdb::Api.key(ENV['movie_db_key'])
    @shows = Tmdb::TV.find(params[:q])

    render :index
  end

end
