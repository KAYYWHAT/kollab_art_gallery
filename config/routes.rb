Rails.application.routes.draw do
  resources :galleries do
    post 'apply', on: :member
  end

  devise_for :users

  root to: "pages#home"

  resources :applications, only: [:destroy]

  resources :users do
    resources :applications, only: [:show, :index, :edit, :update]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
