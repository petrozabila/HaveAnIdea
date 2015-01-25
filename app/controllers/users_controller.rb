class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(params.require(:user).permit(:name, :email, :password))
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		redirect_to :back
  	end
  end


def show
  @users = User.all
  @user = current_user
  @user.id = current_user.id
  
end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
    

end
