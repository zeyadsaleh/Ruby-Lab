class UsersController < ApplicationController
  def index
    redirect_to articles_path 
  end
  def new
    @user = User.new 
  end
  def create
    @user = User.new(users_params)
    if @user.save
      # abort @user.inspect
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to articles_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end
  end

  private
      def users_params
        params.require(:user).permit(:username, :password, :email, :password_confirmation)
      end
end
