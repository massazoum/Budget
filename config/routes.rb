Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 
  authenticated :user do
    root 'items#index', as: :authenticated_root
  end
  root to: "splash#index"
  get 'splash', to: 'splash#index', as: 'splash'
  resources :items do
    resources :expenses, only: [:index, :new, :create ,:show]
  end

  resources :expenses, only: [:show, :edit, :update, :destroy]
end
