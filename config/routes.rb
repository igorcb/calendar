Rails.application.routes.draw do
  
  get 'home/index'
  resources :rooms do
    resources :meetings
  end
  devise_for :users

  root "home#index"
end
