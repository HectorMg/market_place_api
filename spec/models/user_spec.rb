require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = FactoryGirl.build :user }

  describe "user" do
    it "should respond to attributes" do
      expect(@user).to respond_to(:email)
      expect(@user).to respond_to(:password)
      expect(@user).to respond_to(:password_confirmation)
    end

    it "should be valid" do
      expect(@user).to be_valid
    end
  end
end
