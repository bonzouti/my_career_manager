Rails.application.routes.draw do

  resources :applications do
    resources :contacts, only: [:index, :create]
    resources :steps
  end
  
  devise_for :users

  root "applications#index"

end
