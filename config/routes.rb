Woop::Application.routes.draw do

	mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

	devise_for :users

	match "/webmail" => redirect("http://mail.google.com/a/woop.com.br")
	match "/download/(:file)" => "pages#download"
	match "/produtos/:linha" => "pages#produtos"
	match "/contato/:role" => "pages#contato"
	match "/passo-a-passo" => "pages#passo_a_passo"
	match "/onde-encontrar" => "pages#onde_encontrar"
	match "/seja-um-distribuidor" => "pages#seja_um_distribuidor"
	match "/:action" => "pages"

	root :to => "pages#index"
end