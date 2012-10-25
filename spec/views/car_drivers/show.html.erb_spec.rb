require 'spec_helper'

describe "car_drivers/show" do
  before(:each) do
    @car_driver = assign(:car_driver, stub_model(CarDriver))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
