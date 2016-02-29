class WelcomeController < ApplicationController
  def index
    @movies = []
    @shows = []
  end

  def movie
    Tmdb::Api.key(ENV["movie_db_key"])
    @movie = Tmdb::Movie.detail(params[:id])

    render :movie

  end

  def tvshow
    Tmdb::Api.key(ENV["movie_db_key"])
    @tvshow = Tmdb::TV.detail(params[:id])

    render :tvshow

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
