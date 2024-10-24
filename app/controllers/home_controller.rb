class HomeController < ApplicationController

  def index

    redirect_to '/page_inicial' if user_signed_in?
    
    @users = User.first(2)

    if params[:user].present?
      @users = User.where("nome LIKE ?", "%#{params[:user]}%")
    end

  end

end
