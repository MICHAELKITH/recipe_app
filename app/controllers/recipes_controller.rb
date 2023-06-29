class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:success] = 'Recipe succesfully added'
      redirect_to recipes_path
    else
      flash[:error] = 'Error: Recipe could not be added'
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'You deleted Recipe successfully'
    redirect_back(fallback_location: root_path)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
