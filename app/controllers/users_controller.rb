class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    UserMailer.with(user: @user).welcome_email.deliver_later

    format.html { redirect_to(@user, notice: 'User was successfully created.') }
    format.json { render json: @user, status: :created, location: @user }

    # redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio, :posts_counter).with_defaults(posts_counter: 0)
  end
end
