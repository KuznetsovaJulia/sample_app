require "rails_helper"

feature 'Static pages', %q{
   Check for the correct
links to the Home, Help,
About, and Contact pages.

 } do


  scenario 'should have the right links on the layout' do
    visit root_path
    click_link "About"
    expect(page).to have_title("About | #{@base_title}")
    click_link "Help"
    expect(page).to have_title("Help | #{@base_title}")
    click_link "Contact"
    expect(page).to have_title("Contact | #{@base_title}")
    click_link "Home"
    expect(page).to have_title("#{@base_title}")
    click_link "sample app"
    expect(page).to have_title ("#{@base_title}")
  end

end