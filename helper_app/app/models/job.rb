class Job < ActiveRecord::Base

  has_many :bids
  belongs_to :poster, :class_name => 'User', :foreign_key => 'poster_id'
  belongs_to :helper, :class_name => 'User', :foreign_key => 'helper_id'

end
