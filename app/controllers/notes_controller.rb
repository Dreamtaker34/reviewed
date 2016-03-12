class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new
    @note.user = current_user
    @note.assign_attributes(note_params)

    if @note.movie_id?
      @movie = Movie.find_or_initialize_by(id: @note.movie_id)
      @movie.id = params[:movie_id]
      @movie.assign_attributes(movie_params)

      @movie.save
    end

    if @note.tvshow_id?
      @tvshow = Tvshow.find_or_initialize_by(id: @note.tvshow_id)
      @tvshow.id = params[:tvshow_id]
      @tvshow.assign_attributes(tvshow_params)

      @tvshow.save
    end

    if @note.save
      redirect_to root_path
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.assign_attributes(note_params)

    if @note.movie_id?
      @movie = Movie.find_or_initialize_by(id: @note.movie_id)
      @movie.id = params[:movie_id]
      @movie.assign_attributes(movie_params)

      @movie.save
    end

    if @note.tvshow_id?
      @tvshow = Tvshow.find_or_initialize_by(id: @note.tvshow_id)
      @tvshow.id = params[:tvshow_id]
      @tvshow.assign_attributes(tvshow_params)

      @tvshow.save
    end

    if @note.save
      redirect_to root_path
    end

  end

  def destroy

  end

  private

  def note_params
    params.require(:note).permit(:body, :progress, :rating, :completed, :date_completed, :public, :movie_id, :tvshow_id)
  end

  def movie_params
    params.require(:note).permit(movie_attributes: [:id, :title, :poster_path, :overview, :release_date])[:movie_attributes]
  end

  def tvshow_params
    params.require(:note).permit(tvshow_attributes: [:id, :name, :poster_path, :overview, :first_air_date])[:tvshow_attributes]
  end

end
