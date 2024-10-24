class SeguidosController < ApplicationController

  def index
    @user = User.find(params[:id])
    @seguidos = @user.seguidos

    @seguidos = @seguidos.where("nome LIKE?", "%#{params[:search]}%") if params[:search].present?
  end

  def show
    seguido = Seguido.find(params[:id])
    user = User.where(nome: seguido.nome).first
    redirect_to user
  end

end
