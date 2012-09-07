class Produto < ActiveRecord::Base
	attr_accessor :deseja_apagar_imagem
	belongs_to :sublinha
	mount_uploader :image, AppImageUploader
end

