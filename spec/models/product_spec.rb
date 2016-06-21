require 'rails_helper'

RSpec.describe Product, type: :model do
  before { @product = FactoryGirl.build :product}

  describe "product" do
    it "should respond to attributes" do
      expect(@product).to respond_to(:title)
      expect(@product).to respond_to(:price)
      expect(@product).to respond_to(:published)
      expect(@product).to respond_to(:user_id)
    end

    it "should not be published" do
      expect(@product.published).not_to eql(true)
    end
  end

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of :user_id }
    it { should belong_to :user }
  end
end
