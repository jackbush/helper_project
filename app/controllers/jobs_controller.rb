class JobsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  authorize_resource

  def index
    @jobs = Job.where('date_time > ?', Time.now).where( helper: nil )
    respond_to do |format|
      format.html
      format.json { render json: @jobs }
    end
  end

  def show
    @job = Job.find(params[:id])
    @data = @job.helper_status_json_object
    respond_to do |format|
      format.html
      format.json { render json: @data }
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    Job.assign_user(@job, current_user.id)
    redirect_to jobs_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.helper != nil
      @job.helper_assigned_email
    end
    respond_to do |format|
      format.html {redirect_to dashboard_path}
      format.json { head :no_content, status: :ok }
    end
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:poster_id, :title, :description, :address, :date_time, :postcode, :instructions, :helper_id)
  end
  
end