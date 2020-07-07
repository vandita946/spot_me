Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :goals do
    resources :milestones
  end

  resources :milestones do
    resources :completion_message, only: [:new, :create]
  end
end
