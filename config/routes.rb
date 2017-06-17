Rails.application.routes.draw do


  root 'page#index'


  resources :video

  get 'application/:id', to: 'page#app_show', as: :application
  get 'tester/:id', to: 'page#tester_show', as: :tester
  get 'photo/:id', to: 'photo#show', as: :photo


  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  namespace :api do
    namespace :v1 do
      post 'record', to: 'record#create'
      post 'application/:id/video', to: 'record#upload_video'
    end
  end



end
