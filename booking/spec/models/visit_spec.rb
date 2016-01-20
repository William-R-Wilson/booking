require 'rails_helper'

describe Visit, :type => :model do
  context "created with valid params" do
    before(:each) do
      @p = Price.create
      @v = Visit.new(num_attendees: 20, start_date: "2016-01-01", end_date: "2016-01-02")
    end
    it "has a Price object associated upon initialize" do
      expect(@v.price).to_not be_nil
    end
    it "is valid when it has a start_date, end_date, and num_attendees" do
      expect(@v.valid?).to eq(true)
    end
    it "calculates the number of days" do
      expect(@v.num_days).to eq(2)
    end
    it "calculates total income"
      #can't do this because create_days method is in the controller
      #maybe need an integration test? 
      #expect(@v.income).to eq()
  end

  context "created with invalid params" do
    before(:each) do
      @p = Price.create
    end
    it "validates presence of num_attendees" do
      x = Visit.new(start_date: "2016-01-01", end_date: "2016-01-02")
      expect(x.valid?).to eq(false)
    end
    it "validates start_date presence" do
      x = Visit.new(num_attendees: 20, end_date: "2016-01-02")
      expect(x.valid?).to eq(false)
    end
    it "validates end_date presence" do
      x = Visit.new(num_attendees: 20, start_date: "2016-01-01")
      expect(x.valid?).to eq(false)
    end
  end

  it "calculates total income for the visit"
    #this test should require most other methods in the model
    #in order to work
    #might need to be tested from the controller in order to keep from building
    #the days in this test

end