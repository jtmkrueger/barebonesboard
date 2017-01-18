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

  describe '#new' do
    it 'renders the new view for a logged in user' do
      sign_in @user
      get :new
      response.should render_template :new
    end

    it 'redirects to the sign in page if they havent logged in yet' do
      get :new
      response.should redirect_to :user_session
    end
  end
end
