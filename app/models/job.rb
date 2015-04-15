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

  def helper_assigned_email
    if helper
      UserMailer.job_allocation(helper, self).deliver
    end
  end

  def helper_status_json_object
    data = {}
    helper = self.helper
    applicants = self.applicants
    if helper.nil? && applicants == []
      return data = false
    elsif helper.nil?
      data['applicants'] = true
      self.bids.each do |bid|
        data[bid] = {
          applicant_name: bid.applicant.username,
          applicant_image: bid.applicant.image,
          applicant_id: bid.applicant.id,
          offer_time: bid.date_time.to_formatted_s(:long_ordinal),
          datetime: bid.date_time,
          note: bid.note,
        }
      end
    elsif
      data['helper'] = true
      helper = self.helper
      winning_bid = self.bids.where(applicant: helper)
      data['helper_name'] = helper.username
      data['helper_image'] = helper.image
      data['helper_id'] = helper.id
    end
    data.to_json
  end

end
