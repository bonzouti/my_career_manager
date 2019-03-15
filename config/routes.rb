Rails.application.routes.draw do

  resources :applications do
  	
    resources :contacts, only: [:index, :create, :update, :destroy]

    member do
      get 'archive'
    end

    resources :steps, only: [:new, :create, :update]
    
    member do
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
