class PrizesController < ApplicationController
  
  def index
  	@prizes = Prize.all
  	@reversePrizes = @prizes.reverse
  end

  def new
  	@prize = Prize.new
  end

  def create
  	@prize = Prize.create(prize_params)
  	@prize.save
  	redirect_to prizes_path
  end

  def edit
  	@prize = Prize.find(params[:id])
  end

  def update
  	@prize = Prize.find(params[:id])
  	@prize.update(prize_params)
  end


  def prize_params
  	params.require(:prize).permit(:company, :image, :title, :description, :company_image, :prize_image, :tier)
  end

end
