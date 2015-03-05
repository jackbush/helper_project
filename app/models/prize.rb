class Prize < ActiveRecord::Base

	mount_uploader :company_image, CompanyImageUploader
	mount_uploader :prize_image, PrizeImageUploader
end
