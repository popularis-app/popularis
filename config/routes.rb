Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'about_us', to: 'pages#about_us'
  get 'terms', to: 'pages#terms'
  get 'updating_db', to: 'sentences#updating_db'
  get 'jYai98Pp7', to: 'feedbacks#index', as: :feedbacks

  resources :sentences, only: [:index, :show]
  resources :feedbacks, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
