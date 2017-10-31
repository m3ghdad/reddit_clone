class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      login!(user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find_by(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end
end
