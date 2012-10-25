require 'spec_helper'

describe "car_drivers/edit" do
  before(:each) do
    @car_driver = assign(:car_driver, stub_model(CarDriver))
  end

  it "renders the edit car_driver form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => car_drivers_path(@car_driver), :method => "post" do
    end
  end
end
