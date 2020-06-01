# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def loggedin_user
    return if loggedin?

    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end
end
