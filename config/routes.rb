Rails.application.routes.draw do
  resources :pets
  resources :appointments
  root to: 'visitors#index'
  devise_for :users, skip: :registrations
  resources :users
end
