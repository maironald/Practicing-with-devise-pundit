class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    authorize @post
  end
  def new
  
  end
  def create
    @post = Post.new(post_params)
    authorize @post
    if current_user.posts.create(post_params)
      redirect_to user_session_path
    else
      redirect_to home_index_path
    end
  end
  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end
  private
  def post_params
      params.require(:post).permit(:title, :body)
  end
end