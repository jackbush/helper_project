class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :postcode
      t.string :instructions
      t.integer :poster
      t.integer :helper
      t.string :applicants

      t.timestamps null: false
    end
  end
end
