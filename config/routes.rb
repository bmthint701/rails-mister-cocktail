Rails.application.routes.draw do
  resources :cocktails, only: [:show, :new, :create] do
    resources :ingredients
    resources :doses
  end

  root to: 'cocktails#index'
end
