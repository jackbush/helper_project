class JobsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  authorize_resource

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    binding.pry
    @data = @job.construct_custom_json_object


    if helper?
      data = {}
      data.helper_name = self.helper.helper
      data.sbgh = dfhjgj
      data.to_json
    else applicants?
      data = {}
      


    respond_to do |format|
      format.html
      format.json { render json: @data }
    end
    # access a class method here to return helper if present or applicants for json
    # @selection = ...
  end

  def new
    @job = Job.new
  end

  def create
    #refactor this out to model
    @job = Job.create(job_params)
    @job.poster_id = current_user.id
    @job.save
    redirect_to jobs_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    respond_to do |format|
      format.html
      format.json { head :no_content, status: :ok }
    end
    # hit this on assigning helper
    # UserMailer.job_allocation(@job.helper.email).deliver
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