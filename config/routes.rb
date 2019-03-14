Rails.application.routes.draw do

  resources :applications do
    resources :contacts, only: [:index, :create, :update, :destroy]
    resources :steps
  end
  
  devise_for :users

  root "applications#index"

end
