class PostsController < ApplicationController
  # How many points costs a new post
  POINTS_PER_POST = 3

  before_action :logged_in_user, only: [:index, :new]

  def index
    @posts = @current_user.posts.paginate(page: params[:page],  per_page: 5)
  end

  def new
    @post = Post.new
  end

  # Home page
  def welcome
  end

  def create
    @post = current_user.posts.build(post_params)
    if !enough_points?
      flash[:danger ] = "You don't have enough points!"
      redirect_to posts_new_path
    else
      if @post.save
        flash[:success ] = "New Post created!"
        redirect_to posts_index_path
      else
        render 'new'
      end
    end

  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  private
  # Clean up the params before creating the post
  def post_params
    params.require(:post).permit(:content)
  end

  def enough_points?
    current_user.available_point < POINTS_PER_POST ? false: true
  end

end
