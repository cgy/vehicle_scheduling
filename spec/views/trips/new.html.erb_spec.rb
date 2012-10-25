require 'spec_helper'

describe "trips/new" do
  before(:each) do
    assign(:trip, stub_model(Trip,
      :car_id => 1,
      :user_id => 1,
      :destination_id => 1
    ).as_new_record)
  end

  it "renders new trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trips_path, :method => "post" do
      assert_select "input#trip_car_id", :name => "trip[car_id]"
      assert_select "input#trip_user_id", :name => "trip[user_id]"
      assert_select "input#trip_destination_id", :name => "trip[destination_id]"
    end
  end
end
