require 'rails_helper'

describe Day, :type => :model do
  before(:each) do
    @day = Day.create(date: Date.today)
  end
  #it "has numerical values for breakfast, lunch and dinner"
  it "has a date" do
    expect(@day.date).to be_a(Date)
  end
  it "initializes with a default hours value of 0" do
    expect(@day.hours).to eq(0)
  end
  it "initializes with a default waive_facility_rental set to false" do
    expect(@day.waive_facility_rental).to eq(false)
  end

end
