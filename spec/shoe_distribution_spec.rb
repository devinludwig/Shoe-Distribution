require('spec_helper')

describe('the assign brands path', {:type => :feature}) do
  it('assigns the checked brands to the store') do
    visit('/')
    fill_in('store', :with => "Sammy's Shoes")
    click_button('Add Store')
    fill_in('brand', :with => 'Nike')
    click_button('Add Brand')
    fill_in('brand', :with => 'Adidas')
    click_button('Add Brand')
    click_link("Sammy's Shoes")
    check('Nike')
    check('Adidas')
    click_button('Assign Brands')
    expect(page).to have_content('Current brands in stock: Nike Adidas')
  end
end
