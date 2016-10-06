class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:session][:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = user.name << ", you are now logged in!"
        redirect_back_or root_url
      else
        message = "Account not activated!"
        message += " Check you email for the activation link!"
        flash[:warning] = message
        redirect_to root_url
      end
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:danger] = "Username or password does not match!"
      redirect_to '/login'
    end
  end

  def destroy
    log_out if logged_in? #fix kada imamo vise tabova
    redirect_to root_url
  end
end
