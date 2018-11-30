Rails.application.routes.draw do
  get 'users/edit'

  get 'users/show'

 devise_for :users
 resources :users, only: [:show, :edit, :update]
 resources :posts do
 	resource :favorites, only: [:create, :destroy]
 end

 root 'posts#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
