require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validates that a product with four fields set will save' do 
      @category = Category.create(name: 'Furniture')
      @product = Product.new(
        name: 'bed',
        price: 20.00,
        quantity: 10,
        category_id: @category.id
      ).save
      expect(@product).to eq(true)
    end

    it'validates that a product without a name will not save' do
      @category = Category.create(name: 'Furniture')
      @product = Product.create(
        name: nil,
        price: 20.00,
        quantity: 10,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end

    it'validates that a product without a price will not save' do
      @category = Category.create(name: 'Furniture')
      @product = Product.create(
        name: 'bed',
        price: nil,
        quantity: 10,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end

    it'validates that a product without a quantity will not save' do
      @category = Category.create(name: 'Furniture')
      @product = Product.create(
        name: 'bed',
        price: 20.00,
        quantity: nil,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    it'validates that a product without a category will not save' do
      @category = Category.create(name: 'Furniture')
      @product = Product.create(
        name: 'bed',
        price: 20.00,
        quantity: 10,
        category_id: nil
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end
  end
end