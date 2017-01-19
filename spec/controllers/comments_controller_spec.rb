require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:all) do
    @user = create(:user)
  end

  after(:all) do
    @user.destroy
  end

  describe '#post' do
    it 'returns the comment json if theyre logged in' do
      sign_in @user

      post :create, {:body => Faker::StarWars.quote, :format => 'json'}
      response.should be_success
    end

    it 'wont let unsigned in users create posts' do
      post :create, {:body => Faker::StarWars.quote, :format => 'json'}
      response.should_not be_success
    end
  end
end
