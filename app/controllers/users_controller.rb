class UsersController < ApplicationController

  def show
    redirect_to '/perfil' if params[:id].to_i == current_user.id
    @users = User.remove_connected_user(current_user.id).first(4)
    @user = User.find(params[:id])
 
    @ja_seguindo = Seguidor.exists?(seguidor_id: current_user.id, seguido_id: @user.id)
  end

  def perfil
    @users = User.remove_connected_user(current_user.id).first(4)
    ids_five_users = @users.pluck(:id).join(",")
    @users_sugestoes = User.remove_connected_user(current_user.id).remove_five_users(ids_five_users).first(6)
  end

  def bio
    user = User.find(current_user.id)
    if params[:bio].present?
    end
    user.bio = params[:bio]
    user.save
    redirect_to '/perfil'
  end

  def follow
    user = User.find(params[:id])
    user.method_follow(user, current_user)

    current_user.method_follow_seguidos(user, current_user)
    redirect_to user
  end

  def unfollow
    user = User.find(params[:id])
    user.seguidors.delete_by(seguidor_id: current_user.id)
    current_user.seguidos.delete_by(seguido_id: user.id)
    redirect_to user
  end

end
