class BidsController < ApplicationController

  before_action :authenticate_user!
  authorize_resource

  def index
    redirect_to dashboard_path
  end

  def show
    @bid = Bid.find(params[:id])
    @job = Job.find(@bid.job_id)
  end

  def new
    @job = Job.find(params[:job_id])
    @bid = @job.bids.new
    @bid.date_time = @job.date_time
  end

  def create
    @bid = Bid.create(bid_params)
    Bid.initialize_new(@bid, params, current_user.id)
    redirect_to jobs_path
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    @bid.update(bid_params)
    redirect_to dashboard_path
  end

  def destroy
    Bid.find(params[:id]).destroy
    redirect_to dashboard_path
  end

  private
  def bid_params
    params.require(:bid).permit(:job_id, :applicant_id, :date_time, :note)
  end

end
