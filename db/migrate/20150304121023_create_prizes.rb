class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :company
      t.string :image
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
