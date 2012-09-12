class Sublinha < ActiveRecord::Base
	belongs_to :linha
	has_many :produtos
	mount_uploader :title_image, AppImageUploader

	attr_accessible :linha_id, :name, :title_image
end