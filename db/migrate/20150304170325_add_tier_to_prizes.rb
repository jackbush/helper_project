class AddTierToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :tier, :string
  end
end
