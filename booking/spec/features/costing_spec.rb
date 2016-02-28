require 'rails_helper'

describe "Costing" do
  before(:all) do
    @price = Price.create(breakfast: 10,
                          lunch: 12,
                          dinner: 14,
                          dorm: 45,
                          horton: 60,
                          lodge: 60,
                          rentalfee: 150
                          )
    @guest = Guest.create(email: "group@group.com",
                          address: "123 12th St.",
                          city: "Knoxville",
                          state: "TN",
                          name: "Group",
                          bill_to: "Group",
                          )
  end
  before(:each) do
    @visit1 = Visit.create(num_attendees: 20,
                        start_date: "2016-01-01",
                        end_date: "2016-01-02",
                        guest_id: @guest.id,
                        needs_projector: true,
                        needs_childcare: true,
                        needs_stafftime: true,
                        needs_supplies: true,
                        status: 0,
                        price_id: @price.id
                        )
    end

  describe "Show" do
    it "shows basic cost info" do
      visit costing_path(@visit1)
      within "h2" do
        expect(page).to have_content "Group"
      end
    end
  end

end
