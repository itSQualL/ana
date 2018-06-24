Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :blocks, only: [:create, :destroy]
      resources :relationships, only: [:index, :create, :update, :destroy]
      resources :notes, only: [:index, :create, :update, :destroy]
    end
  end
end
