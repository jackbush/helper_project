class AddPostcodeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :postcode, :string
  end
end
