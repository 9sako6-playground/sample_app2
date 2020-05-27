# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user&.authenticated?(params[:id], attribute: :activation) && !user.activated?
      user.activate
      login(user)
      flash[:success] = 'Account activated!'
      redirect_to(user)
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to(root_url)
    end
  end
end
