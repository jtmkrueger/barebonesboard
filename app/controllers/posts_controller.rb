class PostsController < ApplicationController
  respond_to :json, :html
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.paginate(:page => params[:page]).order(:created_at => :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(:page => params[:page]).order(:created_at => :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      respond_with(@post)
    end
  end

 private
    def post_params
      params.permit(:title, :body)
    end
end
