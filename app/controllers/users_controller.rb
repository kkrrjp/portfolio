class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def signup
    @user = User.new
    @title = "新規登録 - #{Portfolio::Application.config.site_title}"
  end

  def show
    @user_name = params[:user_name]
    @user = User.find(:first, :conditions=>["delflg=? and name=?",0, @user_name])
    raise 404 if @user.nil?
    @title = "#{@user_name} - #{Portfolio::Application.config.site_title}"
  end

  def create
    @user = User.new(params[:user])
    @user.nickname = ""
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the #{Portfolio::Application.config.site_title}!"
      redirect_to "/#{@user.name}"
    else
      @title = "新規登録 - #{Portfolio::Application.config.site_title}"
      render 'signup'
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
