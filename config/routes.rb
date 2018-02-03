Rails.application.routes.draw do
  root "static_pages#home"

  get '/privacy', to: 'static_pages#privacy'
  get '/legal', to: 'static_pages#terms'
  get '/dog', to: 'static_pages#terms'
  get '/location', to: 'static_pages#location'

  resources :projects, except: [:destroy]
end
