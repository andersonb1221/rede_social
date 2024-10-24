class PageInicialController < ApplicationController

  def index
    @five_users = User.remove_connected_user(current_user.id).first(5)
    ids_five_users = @five_users.pluck(:id).join(",")
    @users = User.remove_connected_user(current_user.id).remove_five_users(ids_five_users).first(6)
  end

end
