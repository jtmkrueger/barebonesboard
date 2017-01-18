class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:comments)
  end
end
