Rails.application.routes.draw do

  resources :applications do
  	
    resources :contacts, only: [:index, :create, :update, :destroy]

    resources :steps

    member do
      get 'archive'
      put 'update_job_offer'
      put 'update_notes'
    end

  end

  devise_for :users

  resources :users, only: [:show]

  resources :archived, :only => [:index]
  
  namespace :admin do
    root 'dashboards#index'
    resources :users
  end

  root "applications#index"

end
