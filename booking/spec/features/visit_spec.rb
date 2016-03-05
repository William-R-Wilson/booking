require "rails_helper"
include LoginHelper

describe "Visit" do

  before(:all) do
    @user  = User.create(email:"visit_feature_user@example.com", password: "12345678")
    @p = Price.create(tier: "test")
    @g = Guest.create(email: "visit_feature_guest@example.com", address: "123 123rd St", city: "Wetumpka", state: "AL", zip: "12345", name: "Visit Feature Spec Group", bill_to: "Test Group")
    #@v = Visit.create(num_attendees: 30, start_date: "2016-02-02", end_date: "2016-02-05", guest_id: @g.id, price_id: @p.id)
  end

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: "12345678"
    click_button 'Log in'
  end

  describe "new" do
    it "creates a visit and redirects to visit/show" do
      visit new_visit_path
      expect(page).to have_content "Plan a visit"
      fill_in "visit[num_attendees]", with: 30
      click_button "Submit"
      expect(page).to have_content("Visit Feature Spec Group")
    end
  end

end
