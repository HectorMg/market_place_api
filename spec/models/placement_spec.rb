require 'rails_helper'

RSpec.describe Placement, type: :model do
  before { @placement = FactoryGirl.build :placement }

  describe "placement" do
    it "should respond to attributes" do
      expect(@placement).to respond_to(:order_id)
      expect(@placement).to respond_to(:product_id)
    end
  end

  describe "validations" do
    it { should belong_to :order }
    it { should belong_to :product }
  end
end
