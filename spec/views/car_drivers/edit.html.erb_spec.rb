require 'spec_helper'

describe "car_drivers/edit" do
  before(:each) do
    @car_driver = assign(:car_driver, stub_model(CarDriver,
      :car_id => 1,
      :driver_id => 1,
      :available => false
    ))
  end

  it "renders the edit car_driver form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => car_drivers_path(@car_driver), :method => "post" do
      assert_select "input#car_driver_car_id", :name => "car_driver[car_id]"
      assert_select "input#car_driver_driver_id", :name => "car_driver[driver_id]"
      assert_select "input#car_driver_available", :name => "car_driver[available]"
    end
  end
end
