class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]
    if @recipe_food.save
      flash[:success] = 'Succesfully added food recipe'
      redirect_to recipe_path(params[:recipe_id])
    else
      flash[:error] = 'Error: Failed to add Food recipe'
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @food = @recipe.foods.find(params[:id])
    @recipe_food = RecipeFood.find_by(food_id: @food.id)
    @recipe_food.destroy
    flash[:notice] = 'Food Recipe removed successfully'
    redirect_back(fallback_location: root_path)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
