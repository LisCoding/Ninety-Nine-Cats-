class SessionsController < ApplicationController

  def new
  #present a user login form
    render :new
  end

  def create
  #signs in a user in
  @user = User.find_by_credentials(
    params[:user][:username]
    params[:user][:password]
  )

  if @user.nil?
    #no user with given name
    render :new
  else
    # sign the user
    login_user!(user)
    redirect_to  cats_url(@user)
  end

  def destroy
   #sign out the user
    logout_user!
    redirect_to  new_session_url
  end


end
