require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a stylist', {:type => :feature}) do
  it('adds a stylist to the list of stylists') do
    visit('/')
    click_link('Stylists')
    fill_in('stylist-name', :with => 'Zohan')
    click_button('Add Stylist')
    expect(page). to have_content('Zohan')
  end
end

describe('display a stylist page when the user clicks on a stylist name', {:type => :feature}) do
  it('lists stylist and provides a link to a stylist page') do
    visit('/')
    click_link('Stylists')
    fill_in('stylist-name', :with => 'Vidal')
    click_button('Add Stylist')
    click_link('Vidal')
    expect(page).to have_content('Add a client for Vidal')
  end
end

describe('adding a client', {:type => :feature}) do
  it('adds a client to a Stylist') do
    visit('/')
    click_link('Stylists')
    fill_in('stylist-name', :with => 'Gal')
    click_button('Add Stylist')
    click_link('Gal')
    fill_in('client-name', :with => "Guy")
    click_button('Add Client')
    expect(page).to have_content('Guy')
  end
end

describe('allows user to change the name of a stylist they have added', {:type => :feature}) do
  it('adds a stylist to the list of stylists, then deletes it') do
    visit('/')
    click_link('Stylists')
    fill_in('stylist-name', :with => 'Jilll')
    click_button('Add Stylist')
    click_link('Jilll')
    expect(page).to have_content('Jill')
    fill_in('new_name', :with => 'Jill')
    expect(page).to have_content('Jill')
  end
end
