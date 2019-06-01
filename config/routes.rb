Rails.application.routes.draw do
  
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'floors/show'
  get 'rooms/show'
  post 'rooms/commented'
  patch 'rooms/confirm'
  get 'rooms/move'
  get 'rooms/moved'
  get 'rooms/edit'
  patch 'rooms/update'
  get '/rooms/noroom'
  get '/rooms/reset'
  get '/welcome/roomsearch'
  get '/welcome/instruction'
  post '/welcome/generate'
  post 'rooms/alerted'
  
  root to: 'welcome#index'
end
