Rails.application.routes.draw do
  resources :emails, only: [:new, :index, :create, :show]
  resources :templates, only: [:new, :create, :index]
  
  root "emails#index"
  
  get 'template_show',  to: 'emails#show_template'
  
  put 'select_template/:id',  to: 'templates#select_template', as: 'select_template'
end
