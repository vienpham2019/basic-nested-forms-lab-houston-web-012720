class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times{@recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.create(params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity]))
    redirect_to recipe_path(@recipe)
  end
end
