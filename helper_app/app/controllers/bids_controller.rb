class BidsController < ApplicationController

  def index
    @bids = Bid.all
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    redirect_to bids_path
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    @bid.update(bid_params)
    redirect_to bids_path
  end

  def destroy
    Bid.find(params[:id]).destroy
    redirect_to bids_path
  end

  private
  def bid_params
    params.require(:bid).permit(:job_id, :applicant_id, :jobdatetime, :note)
  end

end
