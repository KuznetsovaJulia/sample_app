require "rails_helper"
feature 'when i visit page i want to see title' do
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  scenario "Home title" do
  visit '/static_pages/home'
  expect(page).to have_title ("Home | #{@base_title}")
  end
  scenario "Contact title" do
    visit '/static_pages/contact'
    expect(page).to have_title ("Contact | #{@base_title}")
  end
  scenario "Help title" do
    visit '/static_pages/help'
    expect(page).to have_title("Help | #{@base_title}")
  end
  scenario "About title" do
    visit '/static_pages/about'
    expect(page).to have_title ("About | #{@base_title}")
  end
  end