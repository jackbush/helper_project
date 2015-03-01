class RenameHelperInBidModel < ActiveRecord::Migration
  def change
    rename_column :bids, :helper, :applicant
  end
end
