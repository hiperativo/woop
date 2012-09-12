class Clipping < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	attr_accessible :name, :image, :lancamento
end
