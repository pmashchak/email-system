Rails.application.routes.draw do
  resources :users do
    resources :visits, only: [:create]
  end
end
