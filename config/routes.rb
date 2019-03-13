Rails.application.routes.draw do

  resources :applications do
    resources :contacts, only: [:index]
    resources :steps
  end
  
  devise_for :users

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  root "applications#index"

end
