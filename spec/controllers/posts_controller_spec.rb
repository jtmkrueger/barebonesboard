require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do
    @user = create(:user)
  end

  after(:all) do
    @user.destroy
  end

  describe '#index' do
    it 'gets all the posts' do
      post = create(:post, :user_id => @user.id)

      get :index
      assigns(:posts).should eq([post])

      post.destroy
    end

    it 'should return a 200 HTTP code' do
      response.status.should eq(200)
    end

    it 'renders the index view' do
      get :index
      response.should render_template :index
    end
  end

  describe '#post' do
    it 'returns the post json if theyre logged in' do
      sign_in @user

      post :create, {:title => Faker::StarWars.character, :body => Faker::StarWars.quote, :format => 'json'}
      response.should be_success
    end

    it 'wont let unsigned in users create posts' do
      post :create, {:title => Faker::StarWars.character, :body => Faker::StarWars.quote, :format => 'json'}
      response.should_not be_success
    end
  end
end
