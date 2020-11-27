Rails.application.routes.draw do
  resources :users, only: [] do
    resources :page_visits, only: [:create]
  end
end
