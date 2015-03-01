class WelcomesController < ApplicationController

  def index
    # static page
  end

  def dashboard
    # current_user.jobs (if user is helper or poster)
    # current_user.bids (if user is bidder)
  end

end
