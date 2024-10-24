class ComentariosController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    comentario = @post.comentarios.new(user_id: current_user.id, comentario: params[:comentario])
    redirect_to @post if comentario.save
  end

  def destroy
    comentario = Comentario.find(params[:id]).destroy
    redirect_to request.referrer
  end

end
