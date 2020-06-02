require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Validates that a user is not saved if a first name is not entered' do 
      @user = User.create(
        first_name: nil,
        last_name: 'Smith',
        email: 'james12@hotmail.com',
        password: '12342'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end

    it 'Validates that a user is not saved if a last name is not entered' do 
      @user = User.create(
        first_name: 'James',
        last_name: nil,
        email: 'james12@hotmail.com',
        password: '12342'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end

    it 'Validates that a user is not saved if an email is not entered' do 
      @user = User.create(
        first_name: 'James',
        last_name: 'Smith',
        email: nil,
        password: '12342'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

    it 'Validates that a user is not saved if a password is not entered' do 
      @user = User.create(
        first_name: 'James',
        last_name: 'Smith',
        email: 'james@hotmail.com',
        password: nil,
        password_confirmation: nil
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end

    it 'Validates that a user is not saved if a passwords do not match' do 
      @user = User.create(
        first_name: 'James',
        last_name: 'Smith',
        email: 'james334@hotmail.com',
        password: '12342',
        password_confirmation: '12241'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it 'Validates that a user is not saved email already exists' do 
     
      @user1 = User.create(
        first_name: 'John',
        last_name: 'Jones',
        email: 'JAMES@GMAIL.COM',
        password: '343',
        password_confirmation: '343'
      )
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to include ("Email has already been taken")
    end


    it 'Validates that a minimum length for a password is met when creating a user' do 
     
      @user1 = User.create(
        first_name: 'John',
        last_name: 'Jones',
        email: 'js@gmail.com',
        password: '343897966',
        password_confirmation: '343897966'
      )
      expect(@user1).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
      it "signs user in and out" do
        user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
        sign_in user
        get root_path
        expect(response).to render_template(:index)
      end
  end
end
