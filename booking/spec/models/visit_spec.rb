require 'rails_helper'

describe Visit, :type => :model do
  context "created with valid params" do
    before(:all) do
      @p = Price.create(tier: "test")
      @g = Guest.create(email: "guest@example.com", address: "123 123rd St", city: "Wetumpka", state: "AL", zip: "12345", name: "Test Group", bill_to: "Test Group")
      @v = Visit.create(num_attendees: 30, start_date: "2016-02-02", end_date: "2016-02-05", guest_id: @g.id, price_id: @p.id)
    end
    it "has a Price object associated upon initialize" do
      #@visit = FactoryGirl.create(:visit)
      expect(@v.price_id).to_not be_nil
    end
    it "is valid when it has a start_date, end_date, and num_attendees" do
      expect(@v.valid?).to eq(true)
    end
    it "calculates the number of days" do
      expect(@v.num_days).to eq(4)
    end
  end

  context "created with invalid params" do
    before(:all) do
      @p = Price.create(tier: "test")
      @g = Guest.create(email: "guest@example.com", address: "123 123rd St", city: "Wetumpka", state: "AL", zip: "12345", name: "Test Group", bill_to: "Test Group")
    end

    it "validates presence of num_attendees" do
      x = Visit.new(start_date: "2016-01-01", end_date: "2016-01-02", guest_id: @g.id, price_id: @p.id)
      expect(x.valid?).to eq(false)
    end

    it "validates start_date is before end_date" do
      x = Visit.new(num_attendees: 20, start_date: "2016-01-03", end_date: "2016-01-02")
      expect(x.valid?).to eq(false)
    end

  end


end
