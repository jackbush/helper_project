class RenameJobPostcodeToAddress < ActiveRecord::Migration
  def change
    rename_column :jobs, :postcode, :address
  end
end
