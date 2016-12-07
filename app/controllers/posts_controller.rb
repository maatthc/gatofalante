class PostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new]

  def index
  end

  def new
  end

  # Presented if user is not logged.
  def welcome
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
