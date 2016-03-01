class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new
    @note.user = current_user
    @note.assign_attributes(note_params)

    if @note.save
      redirect_to root_path
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def note_params
    params.require(:note).permit(:body, :progress, :rating, :completed, :date_completed, :public)
  end
end
