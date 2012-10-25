require "spec_helper"

describe CarDriversController do
  describe "routing" do

    it "routes to #index" do
      get("/car_drivers").should route_to("car_drivers#index")
    end

    it "routes to #new" do
      get("/car_drivers/new").should route_to("car_drivers#new")
    end

    it "routes to #show" do
      get("/car_drivers/1").should route_to("car_drivers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/car_drivers/1/edit").should route_to("car_drivers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/car_drivers").should route_to("car_drivers#create")
    end

    it "routes to #update" do
      put("/car_drivers/1").should route_to("car_drivers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/car_drivers/1").should route_to("car_drivers#destroy", :id => "1")
    end

  end
end
