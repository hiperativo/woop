module PagesHelper
	def aba_ativa? (i, linha, params)
		if params[:linha].nil?
			"ativa" if i == 0
		else
			"ativa" if linha.name.parameterize == params[:linha].parameterize
		end
	end

	def foto_produto(img, *options)
		image_tag("#{img}",options[0])
		# image_tag("/assets/produtos/produto-nao-encontrado.png", options[0])
	end

	def m (string)
		Maruku.new(string).to_html.html_safe
	end
end