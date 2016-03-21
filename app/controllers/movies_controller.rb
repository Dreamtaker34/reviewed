class MoviesController < ApplicationController

  def index
    Tmdb::Api.key(ENV["movie_db_key"])
    @playing = Tmdb::Movie.now_playing
    @upcoming = Tmdb::Movie.upcoming
  end

  def show

    Tmdb::Api.key(ENV["movie_db_key"])
    @movie = Tmdb::Movie.detail(params[:id])

    @notes = Note.where('movie_id = ? AND shared IS NOT NULL AND shared != ?', @movie['id'], '')
    @note = Note.find_or_initialize_by(movie_id: @movie['id'], user: current_user)
    # raise
    # render :movie

  end

end
