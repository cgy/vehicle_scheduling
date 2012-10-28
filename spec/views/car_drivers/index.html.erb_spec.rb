require 'spec_helper'

describe "car_drivers/index" do
  before(:each) do
    assign(:car_drivers, [
      stub_model(CarDriver,
        :car_id => 1,
        :driver_id => 2,
        :available => false
      ),
      stub_model(CarDriver,
        :car_id => 1,
        :driver_id => 2,
        :available => false
      )
    ])
  end

  it "renders a list of car_drivers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
