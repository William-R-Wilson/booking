require 'rails_helper'
include LoginHelper


describe "Employees" do

  before(:all) do
    @user  = User.create(email:"employeetest@example.com", password: "12345678")
    @employee1 = Employee.create(first_name: "Joe", last_name: "Strummer")
    @employee2 = Employee.create(first_name: "Donald", last_name: "Trump")
  end

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: "12345678"
    click_button 'Log in'
  end

  describe "Index" do
      it "has a list of employees" do
        visit employees_path
        within "h2" do
          expect(page).to have_content "All Employees"
        end
        expect(Employee.count).to eq(2)
        within "div#employees" do
          expect(page).to have_content "Joe Strummer"
          expect(page).to have_link("Delete")
          expect(page).to have_content "Donald Trump"
        end
      end

      it "deletes an employees" do
        visit employees_path
        c = Employee.count
        puts "Employee count is: #{c}"
        within "div#employees" do
          click_link("Delete", match: :first)
          expect(Employee.count).to eq(c-1)
        end
      end
    end

  describe "New" do

    it "adds an employee" do
      visit new_employee_path
      ec = Employee.count
      within 'div#employee-form' do
        find_button("Add Employee")
        fill_in "employee[first_name]", with: "James"
        fill_in "employee[last_name]", with: "Kirk"
        #expect{
        click_button('Add Employee')
        #}.to change(Employee, :count).by(1)

      end
      expect(page).to have_content("All Employees")
      expect(Employee.count).to eq(ec + 1)
    end

    it "requires both first and last name" do
      visit new_employee_path
      ec = Employee.count
      puts "Employee count is: #{ec}"
      within 'div#employee-form' do
        fill_in 'first-name', with: "Full Name"
        click_button 'Add Employee'
        expect(Employee.count).to eq(ec)
        end
      end

    end

  end
