Rails.application.routes.draw do

  resources :applications do
  	
    resources :contacts, only: [:index, :create, :update, :destroy]

    collection do
      patch :sort_identified
      patch :sort_applied
      patch :sort_in_progress
    end 


    member do
      get 'archive'
      put 'update_job_details'
      put 'update_notes'
    end

    resources :steps, only: [:new, :create, :update, :destroy] do
      member do
        patch 'validate'
      end
    end

  end


  devise_for :users

  resources :users, only: [:show, :update] do
    resources :resumes, only: [:create]
  end

  resources :archived, :only => [:index]
  
  namespace :admin do
    root 'dashboards#index'
    resources :users
  end

  root "applications#index"

end
