module LoginHelper

  def user_login(email)
    user  = User.create(email:email, password: "12345678")
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "12345678"
    click_button 'Log in'
  end

  def dammit
    puts "working"
  end

end
