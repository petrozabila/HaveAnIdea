class SessionsController < ApplicationController
  def login
   
  end

  def create
  	@user = User.find_by_email(params[:email])
  	if @user && @user.authenticate(params[:password])  #усли пользователь есть и прошел аутентификацию
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  	redirect_to :back
    end
  end

  def logout
  	reset_session
  	redirect_to root_path
  	#session[:user_id] = nil
  end
end
