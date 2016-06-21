require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = FactoryGirl.build :user }

  describe "user" do
    it "should respond to attributes" do
      expect(@user).to respond_to(:email)
      expect(@user).to respond_to(:password)
      expect(@user).to respond_to(:password_confirmation)
      expect(@user).to respond_to(:auth_token)
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
    it { should validate_uniqueness_of(:auth_token)}
  end

  describe "#generate_authentication_token!" do
    it "generates a unique token" do
      allow(Devise).to receive(:friendly_token).and_return("auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql "auniquetoken123"
    end

    it "generates another token when one already has been taken" do
      existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end
  end
end
