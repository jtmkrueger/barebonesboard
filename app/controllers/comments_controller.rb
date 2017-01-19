class CommentsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_with(@comment)
    end
  end

 private
    def comment_params
      params.permit(:body, :post_id)
    end
end
