Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :health_goals do
    resources :chats, only: [:create]
  end

    resources :chats, only: [:show] do
    resources :messages, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
