require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
    @product = Product.find_by id: 10
    @product.reviews.create!({
      name: 'Jane Doe',
      rating: 5,
      description: 'omfg dis amazing'
    })
  end

  scenario "They click on a product name to see product details" do
    # ACT
    visit root_path
    all('h4')[0].click

    # VERIFY
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Quantity'
    expect(page).to have_content 'Price'
    expect(page).to have_content 'Please log in to add review'
  end
end
