Erp::Core::Engine.routes.draw do
	scope "(:locale)", locale: /en|vi/ do
		devise_for :users, class_name: "Erp::User", module: :devise, :controllers => {
			:sessions => "erp/users/sessions"
		}
		root to: "home#index"
		namespace :backend do
			get '/' => 'dashboard#index'
			resources :users do
				collection do
					get 'dataselect'
				end
			end
		end
	end
end
