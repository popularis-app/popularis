Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'about_us', to: 'pages#about_us'
  get 'terms', to: 'pages#terms'

  resources :sentences, only: [:index, :show]
  resources :feedbacks, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
