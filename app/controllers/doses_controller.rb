class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  before_action :set_dose, only: :destroy
  # GET /cocktails/:cocktail_id/new
  def new
    @dose = Dose.new
  end

  # POST /cocktails/:cocktail_id/doses
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # DELETE /doses/:id
  def destroy
    @dose.destroy
    redirect_to cocktails_path, notice: 'Cocktail was successfully destroyed.'
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

end
