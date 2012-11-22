module Admin
  class WorkersController < BaseController
    # GET /workers
    # GET /workers.json
    def index
      @workers = Worker.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @workers }
      end

    end
  end
end
