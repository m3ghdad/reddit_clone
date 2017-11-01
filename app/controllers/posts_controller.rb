class PostsController < ApplicationController
  before_action :require_logged_in!, except: [:show]
  before_action :require_correct_owner!, only: [:edit, :update]

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash.now[:notices] = ["Successful post!"]
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def new
    @post = Post.new
    render :new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

  def require_correct_owner!
    return if current_user.posts.find_by(id: params[:id])
    render json: 'Forbidden', status: :forbidden

  end
end
