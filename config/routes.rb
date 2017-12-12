Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  get '/', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'products', to: 'products#index'
  
  resources :products do
    resources :reviews, :except => [:show, :index]
  end
end
