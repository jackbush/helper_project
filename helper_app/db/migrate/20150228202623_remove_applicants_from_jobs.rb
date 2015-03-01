class RemoveApplicantsFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :applicants
  end
end
