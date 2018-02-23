class DosesController < ApplicationController
  def new
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	@dose = Dose.new
    # @dose.cocktail_id = @cocktail.id
  end

  def create
  	@dose = Dose.new(dose_params)
  	@cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    @doses.each do |dose|
      dose.destroy
    end
    @cocktail.destroy
    redirect_to cocktails_path
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
