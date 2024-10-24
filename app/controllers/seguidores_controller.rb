class SeguidoresController < ApplicationController

  def index
    @user = User.find(params[:id])
    @seguidores = @user.seguidors
    @seguidores = @seguidores.where("nome LIKE?", "%#{params[:search]}%") if params[:search].present?
  end

  def show
    seguidor = Seguidor.find(params[:id])
    user = User.where(nome: seguidor.nome).first
    redirect_to user
  end

end
