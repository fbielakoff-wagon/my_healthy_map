Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :health_goals

  get "up" => "rails/health#show", as: :rails_health_check
end
