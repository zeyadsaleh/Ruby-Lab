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
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end

  private
      def users_params
        params.require(:user).permit(:username, :encrypted_password, :email, :salt)
      end
end
