Rails.application.routes.draw do

  resources :applications do
    resources :contacts, only: [:index]
    resources :steps
    
    member do
      get 'edit_application_details'
      put 'update_application_details'
    end

  end
  
  devise_for :users

  root "applications#index"

end
