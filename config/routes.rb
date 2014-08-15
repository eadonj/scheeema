Scheeema::Engine.routes.draw do
  resources :tables, only: [:index]

  root to: 'tables#index'
end
