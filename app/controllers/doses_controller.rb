class DosesController < ApplicationController
  def destroy
  @dose = Dose.find(params[:id])
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose.destroy
  redirect_to cocktail_path(@cocktail)
  end
end
