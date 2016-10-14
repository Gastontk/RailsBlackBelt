class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      flash[:alert] = "Welcome #{@user.first_name.capitalize} #{@user.last_name.capitalize}!!"

      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
    flash[:alert] = 'Hmm.. something went wrong. Please check you login info.'

      redirect_to '/login'
    end
  end

  def destroy
  	flash[:alert] =' You have been successfully logged out.'
  	session[:user_id] = nil
  	redirect_to '/'

  end
end