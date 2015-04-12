class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:profile]
  authorize_resource

  def profile
    @user = User.find(params[:id])
    @num_posted = @user.poster_jobs.size
    @num_offered = @user.bids.size
    @num_helped = @user.helper_jobs.size
  end

end
