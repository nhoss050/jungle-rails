require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should match password with confirmation" do
      @user = User.new
      @user.first_name = "nima"
      @user.last_name = "javaheri"
      @user.email = "nha14@sfu.ca"
      @user.password = "12345"
      @user.password_confirmation = "123456"

      @user.valid?
      expect(@user.errors[:password_confirmation].size).to eq(1)
    end
    it "should password exist" do
      @user = User.new
      @user.first_name = "nima"
      @user.last_name = "javaheri"
      @user.email = "nha14@sfu.ca"
      @user.password = ""
      @user.password_confirmation = "123456"

      @user.valid?
      expect(@user.errors[:password].size).to be >=1
    end

    it "should password_confirmation exist" do
      @user = User.new
      @user.first_name = "nima"
      @user.last_name = "javaheri"
      @user.email = "nha14@sfu.ca"
      @user.password = "12345"
      @user.password_confirmation = ""

      @user.valid?
      expect(@user.errors[:password_confirmation].size).to eq(1)
    end

    it "should have unique email" do
      @user = User.new
      @user.first_name = "nima"
      @user.last_name = "javaheri"
      @user.email = "nha14@sfu.ca"
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.save!

      @user2 = User.new
      @user2.first_name = "xxxx"
      @user2.last_name = "yyyy"
      @user2.email = "NHA14@sfu.ca"
      @user2.password = "12345"
      @user2.password_confirmation = "12345"


      @user2.valid?
      expect(@user2.errors[:email].size).to eq(1)
    end

    it "should have first name" do
      @user = User.new
      @user.first_name = ""
      @user.last_name = "javaheri"
      @user.email = "nha14@sfu.ca"
      @user.password = "12345"
      @user.password_confirmation = "12345"

      @user.valid?
      expect(@user.errors[:first_name].size).to eq(1)
    end

    it "should have last name" do
      @user = User.new
      @user.first_name = "Nima"
      @user.last_name = ""
      @user.email = "nha14@sfu.ca"
      @user.password = "12345"
      @user.password_confirmation = "12345"

      @user.valid?
      expect(@user.errors[:last_name].size).to eq(1)
    end

    it "should have email" do
      @user = User.new
      @user.first_name = "Nima"
      @user.last_name = "javaheri"
      @user.email = ""
      @user.password = "12345"
      @user.password_confirmation = "12345"

      @user.valid?
      expect(@user.errors[:email].size).to eq(1)
    end

    it "should have email" do
      @user = User.new
      @user.first_name = "Nima"
      @user.last_name = "javaheri"
      @user.email = ""
      @user.password = "12"
      @user.password_confirmation = "12"

      @user.valid?
      expect(@user.errors[:password].size).to eq(1)
    end
  end

  describe '.authenticate_with_credentials' do

    # examples for this class method here
    it " should return nil if no password" do

      @user = User.new
      @user.first_name = "Nimaaaaa"
      @user.last_name = "javaheri"
      @user.email = "zz@zzz.com"
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.save!


      user_x = User.authenticate_with_credentials("zz@zzz.com","")
      expect(user_x).to be_nil
    end

    it " should successfully authenticated" do

      @user = User.new
      @user.first_name = "Nimaaaaa"
      @user.last_name = "javaheri"
      @user.email = "zz@zzz.com"
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.save!



      user_x = User.authenticate_with_credentials("zz@zzz.com","12345")
      expect(user_x.id).to eq(@user.id)
    end

     it " should also successfully authenticated with spaces in email" do

      @user = User.new
      @user.first_name = "Nimaaaaa"
      @user.last_name = "javaheri"
      @user.email = "zz@zzz.com"
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.save!



      user_x = User.authenticate_with_credentials("   zz@zzz.com  ","12345")
      expect(user_x.id).to eq(@user.id)
    end

    it " should also successfully authenticated with cases in email" do

      @user = User.new
      @user.first_name = "Nimaaaaa"
      @user.last_name = "javaheri"
      @user.email = "neW@ZzZ.com"
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.save!



      user_x = User.authenticate_with_credentials("neW@ZzZ.com","12345")
      expect(user_x.id).to eq(@user.id)

    end

  end

end
