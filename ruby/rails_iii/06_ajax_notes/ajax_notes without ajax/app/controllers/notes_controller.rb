class NotesController < ApplicationController
  def index
    @notes = Note.all
    @note = Note.new
  end
  def create
    @note = Note.new(note_params)
    if @note.save
      puts "Success: Created a new note."
    else
      puts "Error: Cannot create a new note."
    end
    redirect_to action: 'index'
  end
  def destroy
      @note = Note.find(params[:id])
      @note.destroy
      redirect_to action: 'index'
  end
  def update
      @note = Note.find(params[:id])
      @note.update(description:params[:description])
      redirect_to action: 'index'
  end
  private
  def note_params
    params.require(:note).permit(:title, :description)
  end
end
