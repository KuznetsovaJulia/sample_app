require "rails_helper"
feature 'when i visit page i want to see title' do
  scenario "#title" do
    @base_title = "Ruby on Rails Tutorial Sample App"
    visit '/home'
    expect(page).to have_title( "#{@base_title}")
    visit '/contact'
    expect(page).to have_title("Contact | #{@base_title}")
    visit '/help'
    expect(page).to have_title("Help | #{@base_title}")
    visit '/about'
    expect(page).to have_title("About | #{@base_title}")
  end
end
