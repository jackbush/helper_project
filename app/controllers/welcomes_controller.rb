class WelcomesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  authorize_resource

  def index
  end

  def dashboard
    @poster_jobs = current_user.poster_jobs.where('date_time > ?', Time.now)
    @helper_jobs = current_user.helper_jobs.where(['date_time > ?', Time.now])
    @offers = current_user.bids.where('date_time > ?', Time.now)
  end

end
