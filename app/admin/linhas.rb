ActiveAdmin.register Linha do
  index do
  	column "Linhas" do |linha|
  		link_to linha.name, edit_admin_linha_path(linha)
  	end
  end
  form do |f|
  	f.inputs do
  		f.input :name
  		f.input :ordem, :as => :select, :collection => (1..4).to_a, :include_blank => false
  	end
  	f.buttons
  end
end