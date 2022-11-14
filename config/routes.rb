Rails.application.routes.draw do
  resources :emails, only: [:new, :index, :create]
  root "emails#index"
end
