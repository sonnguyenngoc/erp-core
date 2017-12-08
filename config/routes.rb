Erp::Core::Engine.routes.draw do
	scope "(:locale)", locale: /en|vi/ do
		root to: "backend/dashboard#index"
		scope(:path_names => { :new => "tao-moi", :edit => "cap-nhat" }) do
			devise_for :users,
				class_name: "Erp::User",
				module: :devise,
				:controllers => {
					:sessions => "erp/users/sessions",
					:registrations => "erp/users/registrations",
					:passwords => "erp/users/passwords",
					:confirmations => "erp/users/confirmations",
				}
	
			get '/auth/:provider/callback', to: 'frontend/users#omniauth_login'
	
			namespace :backend do				
				resources :users, :path => "quan-ly-nhan-vien/danh-sach-nhan-vien" do
					collection do
						post 'list'
						get 'dataselect'
						delete 'delete_all'
						put 'activate'
						put 'deactivate'
						put 'activate_all'
						put 'deactivate_all'
					end
				end
				resources :user_groups, :path => "quan-ly-nhan-vien/danh-sach-phan-quyen" do
					collection do
						post 'list'
						get 'dataselect'
					end
				end
				resources :employees, :path => "quan-ly-nhan-vien/thong-tin-nhan-vien" do
					collection do
						get 'dataselect'
						post 'list'
					end
				end
				post '/editor/upload' => 'editor_uploads#upload'
				patch '/editor/upload' => 'editor_uploads#upload'
			end
		end
	end
end
