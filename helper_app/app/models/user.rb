class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :bids, :foreign_key => 'applicant_id'

  include Gravtastic
  gravtastic size: 120, default: "identicon"

  def findjobs
    Job.where(poster: self) + Job.where(helper: self)
  end
  
end
