class Produto < ActiveRecord::Base
	attr_accessor :deseja_apagar_imagem
	belongs_to :sublinha
	mount_uploader :image, AppImageUploader
	attr_accessible :name, :descricao, :principios_ativos, :ph, :acao, :modo_de_usar, :sublinha_id, :image
end

