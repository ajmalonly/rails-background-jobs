Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
