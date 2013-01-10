class Banner < ActiveRecord::Base
	attr_accessible :image, :image_cache, :link, :name
	mount_uploader :image, BannerUploader
end 