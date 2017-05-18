class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  # GET /cocktails/:cocktail_id/new
  def new
    @dose = Dose.new
  end

  # POST /cocktails/:cocktail_id/doses
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@dose)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_path, notice: 'Restaurant was successfully destroyed.'
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
