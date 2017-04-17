require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Validations' do
    before do
      @furniture = Category.create(name: 'furniture')
      @redbookshelf = Product.create(name: 'Red Bookshelf', price: 100, quantity: 10, category: @furniture)
    end
    it "should create valid products" do
      expect(@redbookshelf).to be_a Product
    end
    it "should validate presence of name, price, quantity, and category" do
      expect(@redbookshelf).to be_valid
    end
    it "should belong to a category" do
      expect(@redbookshelf.category).to be_a Category
    end
  end
end
