Rails.application.routes.draw do
  resources :edgemeta
  resources :userfeeds
  resources :games
  resources :answers
  resources :questions
  resources :conditions
  resources :edges
  resources :travelmodes
  resources :nodes
  resources :users
  post 'authenticate', to: 'authentication#authenticate'
  post  'getroute', to: 'games#getroute'
  get  '/nodequestion/:id', to: 'nodes#get_nodequestion'
  get 'listuserloc', to:'games#getusersloc'
  get 'activeconditions', to:'conditions#activeconditions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
