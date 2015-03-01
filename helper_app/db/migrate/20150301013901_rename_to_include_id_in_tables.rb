class RenameToIncludeIdInTables < ActiveRecord::Migration
  def change
    rename_column :bids, :applicant, :applicant_id
    rename_column :bids, :job, :job_id
    rename_column :jobs, :poster, :poster_id
    rename_column :jobs, :helper, :helper_id
  end
end
