Rails.application.routes.draw do
  resources :cocktails, only: [:show, :new, :create, :destroy, :update] do
    resources :doses
  end

  root to: 'cocktails#index'
end
