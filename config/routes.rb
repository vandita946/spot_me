Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :goals do
    resources :milestones
  end

  resources :milestones do
    resources :completion_message
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

end
