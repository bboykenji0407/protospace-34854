Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes do #only: [:index, :create, :destroy, :new, :show, :edit, :update]
    resources :comments,  only: :create
  end
  resources :users, only: :show
end
