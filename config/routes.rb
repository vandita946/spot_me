Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get 'connections/index', as: :connections
  get 'connections/new'
  get 'connections/create'
  get 'connections/:id', to: 'connections#show', as: :connection
  get 'connections/search'
  get 'connections/buddies'
  get 'connections/destroy'

  get 'feeds/index'
  devise_for :users

  root to: 'goals#index'
  # resources :users, only: [:show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :goals do
    resources :milestones
  end


  resources :milestones do
    resources :completion_messages
  end


  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end


  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :connections
  end

  resources :goal_connections, only: [:create, :edit, :update, :destroy]

end
