class Clipping < ActiveRecord::Base
	attr_accessible :name, :image, :lancamento, :image_cache
	mount_uploader :image, ImageUploader
end
