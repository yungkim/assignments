class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.messages
      redirect_to '/users/new'
    end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.messages
      render 'users/edit'
    end
  end

  def destroy
      @user = User.find_by_id(params[:id])
      @user.destroy
      session.clear
      redirect_to '/sessions/new'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end