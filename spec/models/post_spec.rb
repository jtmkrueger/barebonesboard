require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = build(:user)
  end

  context 'validations' do
    it 'should recognize a valid post' do
      build(:post, :user_id => @user.id).should be_valid
    end

    it 'should require a title' do
      build(:post, :user_id => @user.id, :title => '').should_not be_valid
    end
    
    it 'should require a body' do
      build(:post, :user_id => @user.id, :body => '').should_not be_valid
    end
  end

  context 'relationships' do
    it 'should belong to a user' do
      rel = Post.reflect_on_association(:user)
      rel.macro.should == :belongs_to
    end

    it 'should have many posts' do
      rel = Post.reflect_on_association(:posts)
      rel.macro.should == :has_many
    end

    it 'should have many comments' do
      rel = Post.reflect_on_association(:comments)
      rel.macro.should == :has_many
    end
  end
end
