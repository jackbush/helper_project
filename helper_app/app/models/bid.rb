class Bid < ActiveRecord::Base

  belongs_to :job
  belongs_to :applicant_id, :class_name => 'User', :foreign_key => 'applicant_id'

end
