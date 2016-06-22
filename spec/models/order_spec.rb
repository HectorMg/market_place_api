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
    it { should validate_presence_of :total }
    it { should validate_numericality_of(:total).is_greater_than_or_equal_to(0) }
    it { should belong_to :user }
    it { should have_many :placements }
    it { should have_many(:products).through :placements }
  end

end
