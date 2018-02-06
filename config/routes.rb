Rails.application.routes.draw do

  resources :milestones, except: [:index]
  resources :todos, except: [:index, :show]

  root "static_pages#home"

  get '/privacy', to: 'static_pages#privacy'
  get '/legal', to: 'static_pages#terms'
  get '/legal-terms', to: 'static_pages#terms'
  get '/location', to: 'static_pages#location'

  resources :projects, except: [:destroy]
end
