Rails.application.routes.draw do
  resources :page_visits, only: [:create], defaults: { format: :json }
end
