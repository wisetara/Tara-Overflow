require 'spec_helper'

feature 'logging in' do
  scenario 'with correct credentials' do
    user = FactoryGirl.create(:user)
    visit '/login'
    fill_in 'Username', :with => user.username
    fill_in 'Password', :with => user.password
    click_button 'Log In'
    binding.pry
    page.should have_content user.username
  end
end
