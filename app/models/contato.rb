class Contato < ActiveRecord::Base
	validates :name, :presence => 		{:message => "Seu nome deve ser informado"}
	validates :email, :presence => 		{:message => "Seu email deve ser informado"}
	validates :subject, :presence => 	{:message => "Preencha um assunto"}
	validates :message, :presence => 	{:message => "Voce deve preencher uma mensagem"}
end