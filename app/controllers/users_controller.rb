class UsersController < ApplicationController
  def signup
    @user = User.new
    @title = "新規登録 - #{Portfolio::Application.config.site_title}"
  end

  def signin
    @user = User.new
puts @user
    @title = "ログイン - #{Portfolio::Application.config.site_title}"
  end

  def show
    @user_name = params[:user_name]
    @user = User.find(:first, :conditions=>["delflg=? and name=?",0, @user_name])
    @title = "#{@user_name} - #{Portfolio::Application.config.site_title}"
  end
end
