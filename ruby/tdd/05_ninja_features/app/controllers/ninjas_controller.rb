class NinjasController < ApplicationController

  def index
  end

  def create
    ninja=Ninja.new(ninja_params)
    # same as # ninja=Ninja.new(name: ninja_params[:name], description: ninja_params[:description])
    if ninja.save
        redirect_to '/success'
    else
        flash[:errors_name] = "Name is required" if ninja.errors[:name] != []
        flash[:errors_description] = "Description is required" if ninja.errors[:description] != []
        redirect_to '/'
    end
  end

  private

    def ninja_params
        params.require(:ninja).permit(:name, :description)
    end

end
