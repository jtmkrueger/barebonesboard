require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = build(:user)
    @post = build(:post, :user_id => @user.id)
  end

  context 'validations' do
    it 'should recognize a valid comment' do
      build(:comment, :user_id => @user.id, :post_id => @post.id).should be_valid
    end

    it 'should require a body' do
      build(:comment, :user_id => @user.id, :post_id => @post.id, :body => '').should_not be_valid
    end
  end

  context 'relationships' do
    it 'should belong to a user' do
      rel = Comment.reflect_on_association(:user)
      rel.macro.should == :belongs_to
    end

    it 'should belong to a post' do
      rel = Comment.reflect_on_association(:post)
      rel.macro.should == :belongs_to
    end
  end
end
