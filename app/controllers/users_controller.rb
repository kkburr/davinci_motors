class UsersController < ApplicationController
  def new
    @user = User.new #because model is user.rb
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #method to look up id, then stores it in session hash
      redirect_to root_path, notice: "Thank you for signing up #{@user.first_name}"
    else
      render 'new' #action:
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end


