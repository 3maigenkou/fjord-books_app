Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i[index show] do
    resource :follow_relationships, only: [:create, :destroy]
    get 'followings', to: 'users#followings', as: 'followings'
    get 'followers', to: 'users#followers', as: 'followers'
  end
end
