ActiveAdmin.register Clipping do
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
