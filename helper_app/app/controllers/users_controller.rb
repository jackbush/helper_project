class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:profile]
  authorize_resource

  def profile
    @user = User.find(params[:id])
  end

end
