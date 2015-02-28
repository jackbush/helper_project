class Bid < ActiveRecord::Base

  belongs_to :job
  belongs_to :helper, :class_name => 'User', :foreign_key => 'helper'

end
