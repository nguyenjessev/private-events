Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :events
  resources :event_attendances, only: %i[create destroy]
  resources :invites, only: %i[create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'events#index'
end
