Rails.application.routes.draw do
  root to: 'chatrooms#index'
  
  resources :chatrooms, only: [:create, :show, :index, :new]
  resources :messages, only: [:create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
