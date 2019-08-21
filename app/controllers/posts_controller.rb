class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    #@user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end


  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:image_post, :text)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def find_user_post

  end
end
