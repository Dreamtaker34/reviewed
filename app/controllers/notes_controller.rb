class NotesController < ApplicationController
  before_action :require_sign_in

  def index
    @user = current_user
    @notes = @user.notes.all
    @movies = @user.movies
    @tv_shows = @user.tvshows

  end

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

      @title = @movie.title

      @movie.save
    end

    if @note.tvshow_id?
      @tvshow = Tvshow.find_or_initialize_by(id: @note.tvshow_id)
      @tvshow.id = params[:tvshow_id]
      @tvshow.assign_attributes(tvshow_params)

      @title = @tvshow.name

      @tvshow.save
    end

    if @note.save
      flash[:notice] = "You created a note for #{@title}."
    elsif @note.errors.present?
      flash[:alert] = "#{view_context.pluralize(@note.errors.count, 'error')}. Please check Note lengths."
    else
      flash[:alert] = "Failed to write the note."
    end
    redirect_to :back
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

      @title = @movie.title

      @movie.save
    end

    if @note.tvshow_id?
      @tvshow = Tvshow.find_or_initialize_by(id: @note.tvshow_id)
      @tvshow.id = params[:tvshow_id]
      @tvshow.assign_attributes(tvshow_params)

      @title = @tvshow.name

      @tvshow.save
    end

    if @note.save
      flash[:notice] = "You edited your note for #{@title}."
    elsif @note.errors.present?
      flash[:alert] = "#{view_context.pluralize(@note.errors.count, 'error')}. Please check Note lengths."
    else
      flash[:alert] = "Failed to write the note."
    end
    redirect_to :back
  end

  def destroy
    @note = Note.find(params[:id])

    if @note.destroy
      flash[:notice] = "The note was erased."
      redirect_to :back
    else
      flash[:alert] = "Failed to erase the note."
    end
  end

  private

  def note_params
    params.require(:note).permit(:personal, :shared, :progress, :rating, :completed, :date_completed, :movie_id, :tvshow_id)
  end

  def movie_params
    params.require(:note).permit(movie_attributes: [:id, :title, :poster_path, :overview, :release_date])[:movie_attributes]
  end

  def tvshow_params
    params.require(:note).permit(tvshow_attributes: [:id, :name, :poster_path, :overview, :first_air_date])[:tvshow_attributes]
  end

end
