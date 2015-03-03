class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :gender
      t.string :postcode
      t.string :avatar
      t.text :about

      t.timestamps null: false
    end
  end
end
