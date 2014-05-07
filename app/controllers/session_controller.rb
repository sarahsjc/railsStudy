class SessionController < ApplicationController

  def  new
  end


  def create
    binding.pry
    @user = User.authentication(params[:login], params[:password])

    if @user
      session[:user_id] = @user.__id__
      flash[:notice] = "Welcome #{@user.login}"
      redirect_to posts_path
    else
      flash[:notice] = "Wrong password"
      redirect_to_ new_session_path
    end
  end

end