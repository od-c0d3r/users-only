class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :body, :id)
  end

end
