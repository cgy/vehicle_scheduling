module Admins
  class WorkersController < BaseController

    def index
      respond_to do |format|
        format.html
        format.json { render json: WorkersDatatable.new(view_context) }
      end
    end

    def new
      @worker = Worker.new
    end

    def update
      @worker = Worker.find(params[:id])
      if @worker.update_attributes(params[:worker])
        respond_to do |format|
          format.html
          format.js
        end
      else
        render 'edit'
      end

    end

    def edit
      @worker = Worker.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end


    def create

      @worker = Worker.create!(params[:worker])

      respond_to do |format|
        format.html { redirect_to admins_workers_path }
        format.js
      end

    end

    def destroy

      @worker = Worker.find(params[:id])

      if @worker.destroy
        respond_to do |format|
          format.html
          format.js
        end
      else
        redirect_to :back
      end

    end
  end
end
