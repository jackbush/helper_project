class User < ActiveRecord::Base

  has_many :jobs
  has_many :bids, :foreign_key => 'applicant_id'

  def findjobs
    Job.where(poster: self) + Job.where(helper: self)
  end
  
end
