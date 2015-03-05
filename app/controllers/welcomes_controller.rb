class WelcomesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  authorize_resource

  def index
  end

  def dashboard
  end

end
