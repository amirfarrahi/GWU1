Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :conditions
  resources :edges
  resources :travelmodes
  resources :nodes
  resources :users
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
