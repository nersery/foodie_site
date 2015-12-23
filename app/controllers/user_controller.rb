class UserController < ApplicationController
  def signup
  end

  def signup_complete
    u = User.new
    u.username = params[:account]
    if params[:password] === params[:con_password]
      u.password = params[:password]
      if u.save
        flash[:alert] = "Successfully signed up"
        redirect_to "/"
        # Giving session as well
      else
        flash[:alert] = u.errors.values.flatten.join(' ')
        redirect_to :back
      end
    else
      flash[:alert] = "Your password and password confirmation is not the same"
      redirect_to :back
    end
  end

  def login
  end

  def login_complete
    u = User.where(username: params[:account])[0]
    if u
      if u.password === params[:password]
        session[:user_id] = u.id
        flash[:alert] = "Successfully logged in"
        redirect_to "/"
      else
        flash[:alert] = "You should check password again"
        redirect_to :back
      end
    else
      flash[:alert] = "This account is not exist. Please check again"
      redirect_to :back
    end
  end

  def logout_complete
    reset_session
    flash[:alert] = "Successfully logged out"
    redirect_to "/"
  end
end
