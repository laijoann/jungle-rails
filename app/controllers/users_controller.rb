class UsersController < ApplicationController
  include PluralizeHelper
  def new
    @user = User.new
  end

  def create
    if !User.find_by(email: params[:user][:email])
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        render '/users/new'
      end
    else
      flash.notice = "Account already exists. Please log in instead!"
      redirect_to '/signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
