class Passo < ActiveRecord::Base
	attr_accessible :name, :descricao, :principios_ativos, :ph, :acao, :modo_de_usar, :sublinha_id, :image
end
