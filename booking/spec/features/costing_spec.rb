require 'rails_helper'

describe "Costing" do

  before(:all) do
    @user = User.create(email:"costingtest@example.com", password: "12345678")
    @price = Price.create(tier: "test")
    @guest = Guest.create(email: "guest@example.com", address: "123 123rd St", city: "Wetumpka", state: "AL", zip: "12345", name: "Test Group", bill_to: "Test Group")
    @visit = Visit.create(num_attendees: 30, start_date: "2016-02-02", end_date: "2016-02-05", guest_id: @guest.id, price_tier: "test")
    @cost = CostAmount.create(overhead: 25000.00, salary: 45000.00, plate_cost: 7.41, payroll_tax: 0.0765, labor_percentage: 0.3, supplies_percentage: 0.2)
  end

  before(:each) do
    visit new_user_session_path
    expect(page).to have_content "Log in"
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: "12345678"
    click_button 'Log in'
  end

  describe "Show" do
    #let(:price) { FactoryGirl.create(:price) }
    #let(:guest) { FactoryGirl.create(:guest) }
    #let(:visit) { FactoryGirl.create(:visit, price_tier: price, guest_id: guest) }
    it "shows basic cost info" do
      visit costing_path(@visit)
      #save_and_open_page
      within "h2" do
        expect(page).to have_content "Costs"
      end
      within "h3" do
        expect(page).to have_content "Test Group"
      end
    end
  end

end
