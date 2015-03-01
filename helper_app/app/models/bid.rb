class Bid < ActiveRecord::Base

  belongs_to :job
  has_one :poster, through: :job
  belongs_to :applicant, :class_name => 'User', :foreign_key => 'applicant_id'

end
