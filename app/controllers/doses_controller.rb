class DosesController < ApplicationController
  def new
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	@dose = Dose.new
  end

  def create
  	@dose = Dose.new(dose_params)
  	@cocktail = Cocktail.find(params[:cocktail_id])

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
  end


  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
