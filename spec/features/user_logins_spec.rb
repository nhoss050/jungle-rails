require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
   # SETUP
  before :each do
    @user = User.create!(

    first_name: " John",
    last_name: "jones",
    email: "john@jones.com",
    password: "12345"
      )
  end

  scenario "login for works" do
    # ACT
    visit '/sessions/new'

    fill_in 'email', with: 'john@jones.com'
    fill_in 'password', with: '12345'
    click_on 'Sign In!'

    # DEBUG / VERIFY
    sleep 5
    save_screenshot


    expect(find('p.navbar-text').text).to include("John")
  end

end