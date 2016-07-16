require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a stylist', {:type => :feature}) do
  it('adds a stylist to the list of stylists') do
    visit('/')
    fill_in('stylist-name', :with => 'Zohan')
    click_button('Add Stylist')
    expect(page). to have_content('Success!')
  end
end

# describe('display a list of stylists once they have been created', {:type => :feature}) do
#   it('reads back a list of stylists') do
#   visit('/')
#   fill_in('name', :with => 'Zohan')
#   click_button('Add Stylist')
#   click_link('Return to dashboard')
#   expect(page).to have_content('Zohan')
#   end
#   # it('turns list item into a link that leads to a stylist page') do
#   #   visit('/')
#   #   fill_in('name', :with => 'Zohan')
#   #   click_button('Add Stylist')
#   #   click_link('Return to dashboard')
#   #   click_link('Zohan')
#   #   expect(page).to have_content('Delete Zohan')
#   # end
# end
#
# describe('allows user to delete a stylist they have added', {:type => :feature}) do
#   it('adds a stylist to the list of stylists, then deletes it') do
#     visit('/')
#     fill_in('name', :with => 'Zohan')
#     click_button('Add stylist')
#     click_link('Return to dashboard')
#     fill_in('name', :with => 'Freight')
#     click_button('Add stylist')
#     click_link('Return to dashboard')
#     click_link('Zohan')
#     click_button('Delete Zohan')
#     expect(page).to have_no_content('Zohan')
#   end
# end
#
# describe('adding a client', {:type => :feature}) do
#   it('adds a client stop to the list of cities') do
#     visit('/')
#     fill_in('name', :with => 'Zohan')
#     click_button('Add stylist')
#     click_link('Return to dashboard')
#     click_link('Zohan')
#     fill_in('client-name', :with => "Rey")
#     click_button('Add Stop')
#     click_link('Zohan')
#     expect(page).to have_content('Rey')
#   end
# end
