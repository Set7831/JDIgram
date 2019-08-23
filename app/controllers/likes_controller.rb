class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if current_user.already_liked?(@post)
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
      respond_to do |format|
        format.html {redirect_to :back}
        format.js {}
      end
    end
      redirect_to post_path(@post)
  end

  def destroy
    if !(current_user.already_liked?(@post))
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
      respond_to do |format|
        format.html {redirect_to :back}
        format.js {}
      end
    end
      redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  #def already_liked?
  #  Like.where(user_id: current_user.id, post_id:
  #      params[:post_id]).exists?
  #end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
