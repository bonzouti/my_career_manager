Rails.application.routes.draw do

  resources :applications do
    member do
      get 'archive'
    end
    resources :contacts, only: [:index]
    resources :steps
  end
  
  devise_for :users

  resources :archived, :only => [:index]

  root "applications#index"

end
