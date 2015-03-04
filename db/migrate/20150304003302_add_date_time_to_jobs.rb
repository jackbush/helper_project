class AddDateTimeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :date_time, :datetime
  end
end
