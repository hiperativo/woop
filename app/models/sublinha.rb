class Sublinha < ActiveRecord::Base
	belongs_to :linha
	has_many :produtos
	mount_uploader :title_image, AppImageUploader
end