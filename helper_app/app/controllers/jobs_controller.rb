class JobsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  authorize_resource

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    @job.poster_id = current_user.id
    @job.save
    redirect_to jobs_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
  	# binding.pry
    @job = Job.find(params[:id])
    @job.update(job_params)
    # head :no_content, status: :ok
    respond_to do |format|
      format.html
      format.json { head :no_content, status: :ok }
    end
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:poster_id, :title, :description, :postcode, :instructions, :helper_id)
  end
  
end