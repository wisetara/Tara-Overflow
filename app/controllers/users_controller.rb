class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # @user = User.create!(params[:user])
    # respond_to do |format|
    #     format.html { redirect_to root_url }
    #     format.js
    #   end
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserSignup.signup_confirmation(@user).deliver
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
    end

end
