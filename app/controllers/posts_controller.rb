class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = current_user.posts.new(post_params)
    @new_post.save

    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).with_defaults(comments_counter: 0, likes_counter: 0)
  end
end
