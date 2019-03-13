Rails.application.routes.draw do

  get 'contacts/index'
  resources :applications do
  	resources :contacts, only: [:index]
  end
  resources :steps

  devise_for :users

  root "applications#index"

end
