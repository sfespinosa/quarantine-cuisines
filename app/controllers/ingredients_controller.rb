class IngredientsController < ApplicationController

    def index 
        @ingredients = Ingredient.search(params[:search])
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end

end
