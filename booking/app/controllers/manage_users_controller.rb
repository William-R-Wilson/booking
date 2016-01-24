class ManageUsersController < ApplicationController

  def index
    @allUsers = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User #{@user.email} created"
      redirect_to users_path
    else
      flash[:warning] = "Failed to create user"
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = "User #{@user.email} updated"
        format.html { redirect_to users_path }
      else
        flash[:warning] = "User not updated"
        format.html {redirect_to edit_user_path(@user)}
      end
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      flash[:warning] = "User #{@user.email} deleted"
      format.html { redirect_to users_path }
    end
  end


  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end


end
