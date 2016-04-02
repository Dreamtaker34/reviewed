class WelcomeController < ApplicationController
  def index
    @movies = []
    @shows = []
    # @random = [Movie.all.sample.title, Tvshow.all.sample.name].sample

  end

  def search

    if params[:q] == ""
      flash[:alert] = "Must not be blank."
      redirect_to :back
      
    else
      Tmdb::Api.key(ENV["movie_db_key"])
      @movies = Tmdb::Movie.find(params[:q])
      @tv_shows = Tmdb::TV.find(params[:q])

      render :index
    end
  end

end
