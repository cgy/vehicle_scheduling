module Admins
  class DriversController < BaseController

    def index
      respond_to do |format|
        format.html
        format.json { render json: DriversDatatable.new(view_context) }
      end
    end

    def new
      @driver = Driver.new
    end

    def update
      @driver = Driver.find(params[:id])
      if @driver.update_attributes(params[:driver])
        respond_to do |format|
          format.html
          format.js
        end
      else
        render 'edit'
      end

    end

    def edit
      @driver = Driver.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end


    def create

      @driver = Driver.create!(params[:driver])

      respond_to do |format|
        format.html { redirect_to admins_drivers_path }
        format.js
      end

    end

    def destroy

      @driver = Driver.find(params[:id])

      if @driver.destroy
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
