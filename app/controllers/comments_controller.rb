class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(
      text: comment_params,
      author_id: current_user.id,
      post_id: @post.id
    )

    @comment.save

    redirect_to user_path(params[:user_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
