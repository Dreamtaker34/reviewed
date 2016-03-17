class WelcomeController < ApplicationController
  def index
    @movies = []
    @shows = []
  end

  def movie
    Tmdb::Api.key(ENV["movie_db_key"])
    @movie = Tmdb::Movie.detail(params[:id])

    @notes = Note.where(movie_id: params[:id])
    @note = Note.find_or_initialize_by(movie_id: @movie['id'])
    # raise
    render :movie

  end

  def tvshow
    Tmdb::Api.key(ENV["movie_db_key"])
    @tvshow = Tmdb::TV.detail(params[:id])

    @notes = Note.where(tvshow_id: params[:id])
    @note = Note.find_or_initialize_by(tvshow_id: @tvshow['id'])
    # raise/
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
