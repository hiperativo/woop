Woop::Application.routes.draw do

	ActiveAdmin.routes(self)
	devise_for :admin_users, ActiveAdmin::Devise.config
	
	match "/download/(:file)" => "pages#download"
	match "/produtos/:linha" => "pages#produtos"
	match "/contato/:role" => "pages#contato"
	match "/:action" => "pages"

	root :to => "pages#index"
end