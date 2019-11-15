class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id

    if @dose.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end
  end


  def destroy
    @dose = Dose.find(params[:id])
    cocktail_id = @dose.cocktail.id
    @dose.destroy
    redirect_to cocktail_path(cocktail_id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
