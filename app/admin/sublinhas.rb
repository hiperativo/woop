ActiveAdmin.register Sublinha do
	index do
		column "Linhas" do |sublinha|
			sublinha.linha.name
		end

		column "Sub Linhas" do |sublinha|
			image_tag sublinha.title_image_url unless sublinha.title_image.nil?
		end
		default_actions
	end
	form :html => { :multipart => true } do |f|
		f.inputs do
			f.input :linha
			f.input :name
			f.input :title_image, :as => :file
			f.input :remove_title_image, :as => :boolean
			f.input :title_image_cache, :as => :hidden
		end
		f.buttons
	end
end