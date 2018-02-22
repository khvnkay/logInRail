class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    www = user && user.authenticate(params[:session][:password])
    if user 
    	puts "loginpass========================"
      log_in user
      redirect_to user
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end
