Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  # what is pages home?? -joel 16:01 7/7/2020

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

end
