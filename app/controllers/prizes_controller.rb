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


  def prize_params
  	params.require(:prize).permit(:company, :image, :title, :description, :company_image, :prize_image)
  end

end
