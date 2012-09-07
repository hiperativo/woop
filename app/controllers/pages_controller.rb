class PagesController < ApplicationController
	def index
	end

	def empresa
	end

	def produtos
		@linhas = Linha.order(:ordem).includes(:sublinhas => [:produtos])
	end

	def passo_a_passo
		@passos = Passo.all
	end

	def videos
	end

	def onde_encontrar
	end

	def contato
		@contato = Contato.new
	end

	def seja_um_distribuidor
	end

	def imprensa
		@clippings = Clipping.all
	end

	def envio
			@contato = Contato.new(params[:contato])
		if @contato.valid?
			UserMailer.contact_mail(@contato).deliver
			@contato.save
			redirect_to "/index"
		else
			flash[:notice] = @contato.errors
			redirect_to :action => "contato", :contato => params[:contato]
		end
	end

	def em_breve
		render :layout => false
	end

end
