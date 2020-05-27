# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user&.authenticated?(params[:id], attribute: :activation) && !user.activated?
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.current)
      login(user)
      flash[:success] = 'Account activated!'
      redirect_to(user)
    else
      flas[:danger] = 'Invalid activation link'
      redirect_to(root_url)
    end
  end
end
