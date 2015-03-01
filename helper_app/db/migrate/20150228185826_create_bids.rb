class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :job
      t.integer :helper
      t.datetime :jobdatetime
      t.string :note

      t.timestamps null: false
    end
  end
end
