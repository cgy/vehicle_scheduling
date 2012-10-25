require 'spec_helper'

describe "car_drivers/new" do
  before(:each) do
    assign(:car_driver, stub_model(CarDriver).as_new_record)
  end

  it "renders new car_driver form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => car_drivers_path, :method => "post" do
    end
  end
end
