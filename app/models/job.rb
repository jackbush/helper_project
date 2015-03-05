class Job < ActiveRecord::Base

  has_many :bids
  has_many :applicants, through: :bids

  belongs_to :poster, :class_name => 'User', :foreign_key => 'poster_id'
  belongs_to :helper, :class_name => 'User', :foreign_key => 'helper_id'

  validates :poster, presence: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :date_time, presence: true
  validates :address, presence: true
  validates :postcode, presence: true

  def assign_user(job, user)
    job.poster_id = user
    job.save
  end

  def job_status_json_object
    data = {}
    helper = self.helper
    if helper.nil?
      self.bids.each do |bid|
        data.bid_id = {
          bid.applicant_name = self.applicant.username
          bid.applicant_image = self.applicant.image
          bid.applicant_id = self.applicant.id
          bid.date_time = self.date_time
          bid.note = self.note
        }
      end
    else
      winning_bid = self.bids.where(applicant: helper)
      data.helper_name = self.helper.username
      data.helper_image = self.applicant.image
      data.helper_id = self.applicant.id
      data.helper_note = winning_bid.note
      data.helper_date_time = winning_bid.date_time
    end
    data.to_json
  end

end
