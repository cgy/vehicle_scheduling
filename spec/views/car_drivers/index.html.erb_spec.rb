require 'spec_helper'

describe "car_drivers/index" do
  before(:each) do
    assign(:car_drivers, [
      stub_model(CarDriver),
      stub_model(CarDriver)
    ])
  end

  it "renders a list of car_drivers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
