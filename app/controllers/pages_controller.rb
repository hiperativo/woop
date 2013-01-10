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
		@roles = %w[Consumidor Cabeleireiro Distribuidor]
		if request.xhr?
			render layout: false, partial: "shared/form_contato"
		end
	end

	def seja_um_distribuidor
	end

	def imprensa
		@clippings = Clipping.all
	end

	def galeria
		@midia = Midia.all
	end

	def envio
		@contato = Contato.new params[:contato]
		if @contato.valid?
			UserMailer.contact_mail(@contato).deliver
			@contato.save
			# else
			# flash[:notice] = @contato.errors
			# redirect_to :action => "contato", :contato => params[:contato]
		end
			
		respond_to do |f|
			f.json { 
				render json: @contato.errors
			}
		end

	end

	def em_breve
		render :layout => false
	end

end
