Rails.application.routes.draw do
  resources :games
  resources :answers
  resources :questions
  resources :conditions
  resources :edges
  resources :travelmodes
  resources :nodes
  resources :users
  post 'authenticate', to: 'authentication#authenticate'
#  get  'route', to 'games#routeinfo'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
