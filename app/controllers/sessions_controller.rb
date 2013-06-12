class SessionsController < ApplicationController
  def new
    redirect_to "/#{current_user.name}" if signed_in?
    @user = User.new
    @title = "ログイン - #{Portfolio::Application.config.site_title}"
  end

  def create
    @user = User.find(:first,
                     :conditions=>["delflg=? and email=?",
                                     0,params[:user][:email]
                                 ]
                   )
    if @user && @user.authenticate(params[:user][:password])
      sign_in @user
      redirect_to "/#{@user.name}"
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
    
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
