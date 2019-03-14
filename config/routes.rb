Rails.application.routes.draw do

  resources :applications do
    member do
      get 'archive'
    end
    resources :contacts, only: [:index]
    resources :steps
    
    member do
      get 'edit_job_offer'
      put 'update_job_offer'
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
