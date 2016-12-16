require('spec_helper')

describe('the add new store path', {:type => :feature}) do
  it('creates a new store') do
    visit('/')
    fill_in('store', :with => "Sammy's")
    click_button('Add Store')
    expect(page).to have_content("Stores: Sammy's")
  end
end

describe('the add new brand path', {:type => :feature}) do
  it('creates a new brand') do
    visit('/')
    fill_in('brand', :with => "Sammy's")
    click_button('Add Brand')
    expect(page).to have_content("Brands: Sammy's")
  end
end

describe('the delete store path', {:type => :feature}) do
  it('deletes a store') do
    visit('/')
    fill_in('store', :with => "Sammy's")
    click_button('Add Store')
    store = Store.find_by({:name => "Sammy's"})
    find_button("DELETE STORE", {:id => "#{store.id}"}).click()
    expect(page).to_not have_content("Stores: Sammy's")
  end
end

describe('the update store path', {:type => :feature}) do
  it('updates a store') do
    visit('/')
    fill_in('store', :with => "Sammy's")
    click_button('Add Store')
    store = Store.find_by({:name => "Sammy's"})
    find("form##{store.id}").fill_in('name', :with => "Dr. Marten's")
    find("form##{store.id}").click_button("Update Store Name")
    expect(page).to have_content("Stores: Dr. Marten's")
  end
end

describe('the store page path', {:type => :feature}) do
  it('takes you to a store page') do
    visit('/')
    fill_in('store', :with => "Sammy's")
    click_button('Add Store')
    click_link("Sammy's")
    expect(page).to have_content("Return to Main Page")
  end
end

describe('the assign brands path', {:type => :feature}) do
  it('assigns the checked brands to the store') do
    visit('/')
    fill_in('store', :with => "Sammy's")
    click_button('Add Store')
    fill_in('brand', :with => 'Nike')
    click_button('Add Brand')
    fill_in('brand', :with => 'Adidas')
    click_button('Add Brand')
    fill_in('brand', :with => 'Reebok')
    click_button('Add Brand')
    click_link("Sammy's")
    check('Nike')
    check('Adidas')
    click_button('Assign Brands')
    expect(page).to have_content('Current brands in stock: Nike Adidas')
  end
end
