
Rails.application.routes.draw do
  resources :hotels, only: [:index] 
  resources :bookings, only: [:index, :create, :update, :destroy]
end