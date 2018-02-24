class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all.sort_by{ |c| c.name }
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
    ## TODO: strong params
    @cocktail = Cocktail.new(name: params["cocktail"]["name"])
    pass = true
    if @cocktail.save
      params["cocktail"]["doses"].each do |key, value|
        if (value["description"].blank?) && (value["ingredient"].blank?)
          next
        else
          new_dose = Dose.new(description: value["description"], ingredient_id: value["ingredient"], cocktail_id: @cocktail.id)
          unless new_dose.save
            pass = false
            @cocktail.destroy
            break
          end
        end
      end
    else
      pass = false
    end
    pass ? (redirect_to cocktail_path(@cocktail)) : (render :new)
  end

  def destroy
    Cocktail.find(params[:id]).destroy
    redirect_to root_path
  end

  def update
    Dose.create!(cocktail_id: params[:id], ingredient_id: params["cocktail"]["ingredient"]["ingredient"], description: params["cocktail"]["ingredient"]["description"])
    redirect_to cocktail_path(params[:id])
  end

  # private
  #
  # default
end
