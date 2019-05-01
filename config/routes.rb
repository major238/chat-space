Rails.application.routes.draw do
  devise_for :users
	root 'massage#index'
	resources :massage
	resources :users, only: [:edit, :update]
	resources :groups, only: [:new, :create, :edit, :update] do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end