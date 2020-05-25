# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      login(user)
      remember(user)
      redirect_to(user)
    else
      flash.now[:danger] = 'invalid email/password combinations'
      render('new')
    end
  end

  def destroy
    logout if loggedin?
    redirect_to(root_url)
  end
end
