module PagesHelper
	def aba_ativa? (i, linha, params)
		if params[:linha].nil?
			"ativa" if i == 0
		else
			"ativa" if linha.name.parameterize == params[:linha].parameterize
		end
	end

	def foto_produto(img, *options)
		unless img.blank?
			image_tag("#{img}",options[0])
		else
			image_tag("produtos/produto-nao-encontrado.png", options[0])
		end
	end

end