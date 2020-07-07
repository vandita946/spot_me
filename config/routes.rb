Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  # what is pages home?? -joel 16:01 7/7/2020

  resources :goals do
    resources :milestones
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

end
