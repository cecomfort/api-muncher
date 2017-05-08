require_dependency '../../lib/recipe'

class RecipesController < ApplicationController

  def search
    # @recipe = Recipe.new
  end

  def index
    params = recipe_params
    @search_term = params["q"]
    @recipes = Recipe.search(params)
    count = Recipe.count_results(params)

    
    @to = (params["to"] ||= 10).to_i
    @to += 10 if count > @to

    # if more pages 'more' = true
    # page count = 1 => 1 to 10, page count = 2 => 11 to 20
  end

  def show
    @search_term = params["q"]
    @recipe = Recipe.search("q" => params["id"]).first
    #full recipe
  end

  #add strong params
  private

  def recipe_params
    params.require(:recipe).permit(:q, :to, :from)
  end

  # def params_hash
  #   { "q" => params["q"], "from" => params["from"] ||= 0, "to" => params["to"] ||= 10 }
  # end
end
