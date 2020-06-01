# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    if loggedin?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page])
    end
  end

  def help; end

  def about; end

  def contact; end
end
