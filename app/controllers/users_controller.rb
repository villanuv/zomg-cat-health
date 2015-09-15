class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @cats = @user.cats # add to tests
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      @error = 'Create error. Try again.'
      render action: 'new'
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      @error = 'Update error. Try again.'
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end  

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
