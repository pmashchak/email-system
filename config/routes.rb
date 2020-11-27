Rails.application.routes.draw do
  resources :page_visits, only: [:create]
end
