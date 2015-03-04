class Bid < ActiveRecord::Base

  belongs_to :job
  has_one :poster, through: :job
  belongs_to :applicant, :class_name => 'User', :foreign_key => 'applicant_id'

  accepts_nested_attributes_for :job

  validates :applicant, presence: true

  def self.initialize_new(bid, params, user)
    bid.job_id = params[:job_id]
    bid.note = params[:bid][:bid][:note]
    bid.applicant_id = user
    bid.save
  end

end
