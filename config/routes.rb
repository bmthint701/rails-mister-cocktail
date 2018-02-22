Rails.application.routes.draw do
  resources :cocktails, only: [:show, :new, :index, :create] do
    resources :ingredients
    resources :doses
  end
end
