# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :loggedin_user, only: %i(edit update)
  before_action :correct_user, only: %i(edit update)

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def loggedin_user
    return if loggedin?

    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
