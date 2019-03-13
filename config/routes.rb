Rails.application.routes.draw do

  get 'contacts/index'
  resources :applications do
  	resources :contacts, only: [:index]
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "applications#index"

end
