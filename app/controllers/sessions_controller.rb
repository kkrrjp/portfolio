class SessionsController < ApplicationController
  def new
    @user = User.new
puts @user
    @title = "ログイン - #{Portfolio::Application.config.site_title}"
  end

  def create
puts params
    @user = User.find(:first,
                     :conditions=>["delflg=? and email=? and password=?",
                                     0,params[:user][:email],params[:user][:password]
                                 ]
                   )
    if @user && @user.authenticate(params[:session][:password])

    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
    
  end

  def destroy
    
  end
end
