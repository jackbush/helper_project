class Job < ActiveRecord::Base

  has_many :bids
  has_many :applicants, through: :bids

  belongs_to :poster, :class_name => 'User', :foreign_key => 'poster_id'
  belongs_to :helper, :class_name => 'User', :foreign_key => 'helper_id'

  validates :poster, presence: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :address, presence: true
  validates :postcode, presence: true

  def assign_user(job, user)
    job.poster_id = user
    job.save
  end

  def job_status_json_object
    if helper?
      data = {}
      data.helper_name = self.helper.helper
      data.sbgh = dfhjgj
      data.to_json
    else applicants?
      data = {}
  end

end
