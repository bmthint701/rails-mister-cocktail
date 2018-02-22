class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end
  def show
    @cocktail = Cocktail.find(params[:id])
  end
  def new
    @cocktail = Cocktail.new
    @ingredients = []
    @descriptions = []
  end
  def create
    ## TODO: add add'l validaiton
    ## TODO: add new ingredients js
    @cocktail = Cocktail.create(name: params["cocktail"]["name"])
    params["cocktail"]["doses"].each do |key, value|
      unless value["description"].blank?
        Dose.create!(description: value["description"], ingredient_id: value["ingredient"], cocktail_id: @cocktail.id)
      end
    end
    redirect_to cocktail_path(@cocktail)
  end
end
