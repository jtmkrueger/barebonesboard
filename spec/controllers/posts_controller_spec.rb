require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do
    @user = build(:user)
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
end
