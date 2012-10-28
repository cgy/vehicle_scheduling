require 'spec_helper'

describe "car_drivers/show" do
  before(:each) do
    @car_driver = assign(:car_driver, stub_model(CarDriver,
      :car_id => 1,
      :driver_id => 2,
      :available => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
