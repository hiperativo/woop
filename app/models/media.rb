# encoding: utf-8
class Media < ActiveRecord::Base
	attr_accessible :image, :image_cache, :name, :category, :url
	mount_uploader :image, ImageUploader

	attr_accessor :unique_categories

	def self.unique_categories
		select("DISTINCT category").collect(&:category)
	end

	rails_admin do
		edit do 
			field :name
			field :category, :enum do 
				enum do 
					["Imagem", "Video"]
				end
			end

			field :url do 
				help "Digite o código caso seja um vídeo: Ex: blcc21-TwWM"
			end
			field :image
		end
	end
end
