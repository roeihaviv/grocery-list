Rails.application.routes.draw do

  root "items#index"

  devise_for :users

  resources :items do
    patch "move", on: :member
  end
  
end
