class AddCompanyImageToPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :company_image, :string
  end
end
