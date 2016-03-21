class TvShowsController < ApplicationController

  def index
    Tmdb::Api.key(ENV["movie_db_key"])
    @popular = Tmdb::TV.popular
  end

  def show
    Tmdb::Api.key(ENV["movie_db_key"])
    @tvshow = Tmdb::TV.detail(params[:id])

    @notes = Note.where('tvshow_id = ? AND shared IS NOT NULL AND shared != ?', @tvshow['id'], '')
    @note = Note.find_or_initialize_by(tvshow_id: @tvshow['id'], user: current_user)
  end
end
