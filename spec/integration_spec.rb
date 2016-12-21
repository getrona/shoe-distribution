require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new store', {:type => :feature}) do
  it('allows the user to add a new store') do
    visit('/')
    click_link('View Shoes Store')
    fill_in('name', :with => 'Getro')
    click_button('Submit!')
    expect(page).to have_content('Getro')
  end
end

describe('adding a new brand', {:type => :feature}) do
  it('allows the user to add a new brand') do
    visit('/')
    click_link('View Shoes Brand')
    fill_in('name', :with => 'Bob')
    click_button('Submit!')
    expect(page).to have_content('Bob')
  end
end


describe('Deleting a store', {:type => :feature}) do
  it('allows the user to delete a store') do
    store = Store.create({:description => 'Getron'})
    visit('/')
    click_link('View Shoes Store')
    click_link(store.description())
    click_button('Delete Store')
    expect(page).to have_content('GNG Shoes Distribution Center')
  end
end
