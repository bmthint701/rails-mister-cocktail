class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end
  def show
    @cocktail = Cocktail.find(params[:id])
  end
  def new
    @cocktail = Cocktail.new
  end
  def create
    @cocktail = Cocktail.create(name: params["cocktail"]["name"])
    Dose.create(description: params["cocktail"]["doses"]["description"], ingredient_id: params["cocktail"]["doses"]["ingredient_id"], cocktail_id: @cocktail.id)
    redirect_to cocktail_path(@cocktail)
  end
end
