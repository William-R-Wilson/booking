require 'rails_helper'



describe "Employees" do
  before(:each) do
    @employee1 = Employee.create(first_name: "Joe", last_name: "Strummer")
    @employee2 = Employee.create(first_name: "Donald", last_name: "Trump")
  end
  describe "Index" do

      it "has a list of employees" do
        visit employees_path
        within "h1" do
          expect(page).to have_content "All Employees"
        end
        expect(Employee.count).to eq(2)
        within "div#employees" do
          expect(page).to have_content "Joe Strummer"
          expect(page).to have_link("Delete")
        end
      end

      it "deletes employees" do
        visit employees_path
        within "div#employees" do
          click_link "Delete"
          expect(Employee.count).to eq(1)
        end
      end
    end

  describe "New" do
    it "adds an employee" do
      visit new_employee_path
      within 'div#employee-form' do
          expect{
            fill_in 'first-name', with: "James T."
            fill_in 'last-name', with: "Kirk"
            click_button 'Add Employee'
          }.to change(Employee, :count).by(1)
        end
      end

    it "requires both first and last name" do
      visit new_employee_path
      ec = Employee.count
      within 'div#employee-form' do
        fill_in 'first-name', with: "Full Name"
        click_button 'Add Employee'
        expect(Employee.count).to eq(ec)
        end
      end

    end
  end
