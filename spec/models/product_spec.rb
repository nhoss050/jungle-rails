require 'rails_helper'

RSpec.describe Product, type: :model do


  describe 'Validations' do

    before(:each) do
      @category = Category.new
      @product = @category.products.new
      @product.name = "nima"
      @product.price = 12.5
      @product.quantity = 10
    end


    it "should be chill when we are chill" do
      # # @category = Category.new
      # @product = Product.new()

      # @product.category = @category
      # # @product.name = "nima"
      # @product.price = 12.5
      # @product.quantity = 10

      expect(@product).to be_valid
    end



    it "should have a name" do
      # # @product.name = "nima"
      # @product.category = @category
      # @product.price = 12.5
      # @product.quantity = 10

      @product.name = nil

      @product.valid?
      expect(@product.errors[:name].size).to eq(1)
    end

    it "should have a price" do
      @product = @category.products.new
      @product.name = "nima"

      @product.quantity = 10

      # @product.price = nil
      # p "-----------"
      # p @product.price

      @product.valid?
      expect(@product.errors[:price].size).to be >= 1 # numericality should cause a second error

    end

    it "should have a quantity" do
      # @product.category = @category
      # @product.name = "nima"
      # @product.price = 12.5
      # # @product.quantity = 10

      @product.quantity = nil

      @product.valid?
      expect(@product.errors[:quantity].size).to eq(1)
    end

    it "should have a category" do
      # # @product.category = @category
      # @product.name = "nima"
      # @product.price = 12.5
      # @product.quantity = 10

      @product.category = nil


      @product.valid?
      expect(@product.errors[:category].size).to eq(1)
    end






  end
end
