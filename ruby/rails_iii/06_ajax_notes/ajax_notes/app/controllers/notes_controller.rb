class NotesController < ApplicationController
  def index
    @notes = Note.all.order('created_at desc')
    @note = Note.new
  end
  def show
      display_notes()
  end
  def create
    @note = Note.new(note_params)
    @note.save
    display_notes()
  end
  def destroy
      @note = Note.find(params[:id])
      @note.destroy
      display_notes()
  end
  def update
      @note = Note.find(params[:id])
      @note.update(description:params[:description])
      display_notes()
  end

  def display_notes
    @notes = Note.all.order('created_at desc')
    @html_data = ""
    
    @notes.each do |note|
        @html_data += "<div id='individual_note'>
                                        <form action='/notes/#{note.id}' method='POST'>
                                          <input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>
                                          <input type='hidden' name='_method' value='DELETE'>
                                          <h3>
                                            #{note.title} <input type='submit' value='Delete'>
                                          </h3>
                                        </form>
                                        <form action='/notes/#{note.id}' method='POST'>
                                            <input name='authenticity_token' type='hidden' value='#{form_authenticity_token}'>
                                            <input type='hidden' name='_method' value='PATCH'>
                                            <textarea name='description' id='description' placeholder='Enter description here...'>#{note.description}</textarea>
                                            <input name='Update' type='submit' value='Update' />
                                        </form>
                                        <hr>
                                    </div>"
    end

    json_message = {:html_data => @html_data}
    render json: json_message
  end

  private
  def note_params
    params.require(:note).permit(:title, :description)
  end
end
