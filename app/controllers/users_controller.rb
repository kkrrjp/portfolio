class UsersController < ApplicationController
  #efore_filter :signed_in_user, only: []
  #efore_filter :correct_user,   only: [:edit, :update]

  def signup
    @user = User.new
    @title = "新規登録 - #{Portfolio::Application.config.site_title}"
  end

  def show
    @user_name = params[:user_name]
    @user = User.find(:first, :conditions=>["delflg=? and name=?",0, @user_name])
    @title = "#{@user_name} - #{Portfolio::Application.config.site_title}"
  end

  def create
    @user = User.new(params[:user])
    @user.nickname = ""
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to "/#{@user.name}"
    else
      @title = "新規登録 - #{Portfolio::Application.config.site_title}"
      render 'signup'
    end
  end
end
