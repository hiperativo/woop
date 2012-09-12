class UserMailer < ActionMailer::Base
  default :from => "#{ENV['EMAIL_LOGIN']}@#{ENV['EMAIL_DOMAIN']}"
  def contact_mail(usuario)
  	@usuario = usuario
  	mail :to => ENV['EMAIL_RECEIVER'], :bcc => 'pedrozath@gmail.com', :subject => "Contato via Site Woop: #{@usuario.subject}", :reply_to => "contato@woop.com.br"
  end
end