Rails.application.routes.draw do

  resources :applications do
    resources :contacts, only: [:index]
    resources :steps
    
    member do
      get 'edit_job_offer'
      put 'update_job_offer'
    end

  end
  
  devise_for :users

  namespace :admin do
    root 'dashboards#index'
    resources :users
  end

  root "applications#index"

end
