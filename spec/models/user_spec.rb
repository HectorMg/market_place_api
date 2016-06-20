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

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_confirmation_of(:password) }
    it { should allow_value('example@domain.com').for(:email) }
  end
end
