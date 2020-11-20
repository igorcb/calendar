Rails.application.routes.draw do
  resources :meetings
  resources :rooms
  devise_for :users
end
