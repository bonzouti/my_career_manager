Rails.application.routes.draw do

  resources :applications do
    resources :contacts, only: [:index] do
      resources :steps
    end
  end
  
  devise_for :users

  root "applications#index"

end
