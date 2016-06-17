class SecretsController < ApplicationController
  def index
    @secrets=Secret.all
  end

  def create
    @secret = Secret.new(secret_params)
    @user = current_user
    @secret.user = @user
    @secret.save
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    @user = current_user
    secret = Secret.where(id: secret_params[:id]).first
    secret.destroy
    redirect_to "/users/#{@user.id}"
  end

  private

  def secret_params
    params.require(:secret).permit(:content, :id)
  end


end
