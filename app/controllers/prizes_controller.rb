class PrizesController < ApplicationController
  
  def index
  	@prizes = Prize.all
  end

  def new
  	@prize = Prize.new
  end

  def create
  	@prize = Prize.create
  	@prize.save
  	redirect_to prizes_path
  end


  def prize_params
  	params.require(:prize).permit(:company, :image, :title, :description)
  end

end
