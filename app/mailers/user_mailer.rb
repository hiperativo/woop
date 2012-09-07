class UserMailer < ActionMailer::Base
  default :from => "contato@woop.com.br"
  def contact_mail(usuario)
  	@usuario = usuario
  	mail :to => "pedrozath@gmail.com", :subject => "Contato via Site Woop: #{@usuario.subject}", :reply_to => "contato@woop.com.br"
  end
end