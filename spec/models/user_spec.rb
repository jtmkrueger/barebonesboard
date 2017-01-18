require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'should recognize a valid user' do
      build(:user).should be_valid
    end

    it 'should require an email' do
      build(:user, :email => '').should_not be_valid
    end
    
    it 'should require a username' do
      build(:user, :username => '').should_not be_valid
    end
    
    it 'should require a first name' do
      build(:user, :first_name => '').should_not be_valid
    end
    
    it 'should require a last name' do
      build(:user, :last_name => '').should_not be_valid
    end
    
  end
end
