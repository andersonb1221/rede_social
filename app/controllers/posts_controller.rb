class PostsController < ApplicationController

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(params_post)
    if @post.save
      redirect_to '/perfil'
    else
      render :new
    end
  end

  private

  def params_post
    params.require(:post).permit(:titulo, :imagem)
  end

end
