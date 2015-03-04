class AddPrizeImageToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :prize_image, :string
  end
end
