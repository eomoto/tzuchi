Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'home/index'

  resources :articles, only: [:index], path: :blog
  resources :articles, only: [:show], path: :a
  get '/articles/:id', to: redirect('/a/%{id}', status: 301)

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
