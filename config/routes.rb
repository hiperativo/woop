Woop::Application.routes.draw do

	match "/webmail" => redirect("http://mail.google.com/a/woop.com.br")

	ActiveAdmin.routes(self)
	devise_for :admin_users, ActiveAdmin::Devise.config
	
	match "/download/(:file)" => "pages#download"
	match "/produtos/:linha" => "pages#produtos"
	match "/contato/:role" => "pages#contato"
	match "/:action" => "pages"

	root :to => "pages#index"
end