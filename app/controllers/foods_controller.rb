class FoodsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      flash[:success] = 'Food succesfully added'
      redirect_to foods_path
    else
      flash[:error] = 'Error: Food could not be added'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    flash[:notice] = 'You deleted food successfully'
    redirect_back(fallback_location: root_path)
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
