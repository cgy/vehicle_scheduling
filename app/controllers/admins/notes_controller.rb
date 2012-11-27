module Admins
  class NotesController < BaseController
    # GET /notes
    # GET /notes.json
    def index
      @notes = Note.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @notes }
      end

    end
  end
end
