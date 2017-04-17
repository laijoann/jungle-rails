require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @testuser = User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane@doe.com', password: 'JaneDoe', password_confirmation: 'JaneDoe')
    @failpassword = User.create(last_name: 'No', email: 'jane@DOE.COM', password: 'LULNo', password_confirmation: 'JaneNo')
  end
  context 'Validations' do
    it "should create users" do
      expect(@testuser).to be_a User
    end
    it "should validate users" do
      expect(@testuser).to be_valid
      expect(@failpassword).to_not be_valid
    end
    it "should have same password and password confirmation" do
      expect(@testuser.password).to eq(@testuser.password_confirmation)
      expect(@failpassword.password).to_not eq(@failpassword.password_confirmation)
    end
    it "should validate presence of name" do
      expect(@testuser.first_name).to be_present
    end
    it "should validate presence of last_name" do
      expect(@testuser.last_name).to be_present
    end
    it "should validate presence of email" do
      expect(@testuser.email).to be_present
    end
    it "should have valid password of min 6 chars" do
      expect(@failpassword.password.length).to_not be >= 6
      expect(@testuser.password.length).to be >= 6
    end
  end
end
