class BidsController < ApplicationController

  def index
    @bids = Bid.all
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @job = Job.find(params[:job_id])
    @bid = @job.bids.new
  end

  def create
    @bid = Bid.create(bid_params)
    @bid.job_id = params[:job_id]
    @bid.note = params[:bid][:bid][:note]
    @bid.applicant_id = User.last.id
    @bid.save
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
    params.require(:bid).permit(:job_id, :applicant_id, :jobdatetime, :note)
  end

end
