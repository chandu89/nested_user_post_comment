Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  devise_for :users 
  
  root 'posts#index'

  namespace :api do
	  namespace :v1 do
	    resources :users, defaults: { format: 'json' }
	  end
	end
end
