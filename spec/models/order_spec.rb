require 'rails_helper'

RSpec.describe Order, type: :model do
  before{ @order = FactoryGirl.build :order }

  describe "order" do
    it "should respond to attributes" do
      expect(@order).to respond_to(:total)
      expect(@order).to respond_to(:user_id)
    end
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should belong_to :user }
    it { should have_many :placements }
    it { should have_many(:products).through :placements }
  end

  describe "#set_total!" do
    before(:each) do
      product_1 = FactoryGirl.create :product, price: 100
      product_2 = FactoryGirl.create :product, price: 85

      @order = FactoryGirl.build :order, product_ids: [product_1.id, product_2.id]
    end

    it "returns the total amount to pay for the products" do
      expect{@order.set_total!}.to change{@order.total}.from(0).to(185)
    end
  end

end
