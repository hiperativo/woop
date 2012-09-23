ActiveAdmin.register Clipping do
	before_filter { @skip_sidebar = true }

	index :as => :table do |clipping|
		column :lancamento
		column :name
		column "imagem" do |clipping|
			link_to image_tag(clipping.image_url :small), edit_admin_clipping_path(clipping)
		end
		default_actions
	end
  form :html => {:multipart => true} do |f|
  	f.inputs do
  		f.input :name
  		f.input :lancamento
  		f.input :image, :as => :file
   		f.input :image_cache, :as => :hidden
 	end
  	f.buttons
  end
end
