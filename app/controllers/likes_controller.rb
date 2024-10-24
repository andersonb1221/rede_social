class LikesController < ApplicationController
  before_action :find_post
  
  def create
    @like = current_user.likes.new(post_id: @post.id)
    redirect_to "/user/#{params[:id]}" if @like.save
  end

  def destroy
    @like = current_user.likes.find_by(post_id: @post.id)
    redirect_to "/user/#{params[:id]}" if @like.destroy
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end
