class RenameBidsJobDateTimeToBidsDateTime < ActiveRecord::Migration
  def change
    rename_column :bids, :jobdatetime, :date_time
  end
end
