Rails.application.routes.draw do
  root "items#index"

  devise_for :users

  resources :items do
    get "move", on: :member
  end 
end
