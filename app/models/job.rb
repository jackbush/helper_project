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
  #   job.poster_id = user
  #   job.save
  # end

  # def job_status_json_object
  #   if helper.nil?
  #     data = {}
  #     self.bids.each do |bid|
  #       data.bid_id = {
  #         bid.applicant_name = self.applicant.username
  #         bid.applicant_id = self.applicant.id
  #         bid.date_time = self.date_time
  #         bid.note = self.note
  #       }
  #     end
  #   else applicants?
  #     data = {}
  #     data.helper_name = 
  #   end
  #   data.to_json
  end

end
