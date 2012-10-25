class CarDriversController < ApplicationController
  before_filter :admin_user, only: [:new, :edit, :create, :update, :destory]
  # GET /car_drivers
  # GET /car_drivers.json
  def index
    @car_drivers = CarDriver.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @car_drivers }
    end
  end

  # GET /car_drivers/1
  # GET /car_drivers/1.json
  def show
    @car_driver = CarDriver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car_driver }
    end
  end

  # GET /car_drivers/new
  # GET /car_drivers/new.json
  def new
    @car_driver = CarDriver.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @car_driver }
    end
  end

  # GET /car_drivers/1/edit
  def edit
    @car_driver = CarDriver.find(params[:id])
  end

  # POST /car_drivers
  # POST /car_drivers.json
  def create
    @car_driver = CarDriver.new(params[:car_driver])

    respond_to do |format|
      if @car_driver.save
        format.html { redirect_to @car_driver, notice: 'Car driver was successfully created.' }
        format.json { render json: @car_driver, status: :created, location: @car_driver }
      else
        format.html { render action: "new" }
        format.json { render json: @car_driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /car_drivers/1
  # PUT /car_drivers/1.json
  def update
    @car_driver = CarDriver.find(params[:id])

    respond_to do |format|
      if @car_driver.update_attributes(params[:car_driver])
        format.html { redirect_to @car_driver, notice: 'Car driver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @car_driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_drivers/1
  # DELETE /car_drivers/1.json
  def destroy
    @car_driver = CarDriver.find(params[:id])
    @car_driver.destroy

    respond_to do |format|
      format.html { redirect_to car_drivers_url }
      format.json { head :no_content }
    end
  end
end
