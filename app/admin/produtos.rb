ActiveAdmin.register Produto do
	index do
		column :sublinha
		column "Produtos" do |p|
			image_tag p.image_url unless p.image.nil?
		end

		default_actions
	end

	

	form :html => { :multipart => true } do |f|
		f.inputs do
			f.input :sublinha, :collection => Hash[Sublinha.all.map {|s|["#{s.linha.name} - #{s.name}", s.id]}]
			f.input :image, :as => :file
			f.input :image_cache, :as => :hidden
			f.input :remove_image, :as => :boolean
			f.input :name
			f.input :descricao
			f.input :principios_ativos
			f.input :ph
			f.input :acao
			f.input :modo_de_usar
		end
		f.buttons
	end
end