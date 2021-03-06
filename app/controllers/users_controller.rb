class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :coach_user,     only: :destroy

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
      format.json { render :json => @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the NFL Rails App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.xml { render :xml => @users }
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def coach_user
      redirect_to(root_path) unless current_user.coach?
    end
end
