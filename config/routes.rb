Rails.application.routes.draw do
   # get 'pages/hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root 'pages#hello'
  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only: [:index, :new, :show, :create] do
    resources :posts, only: [:index, :new, :show, :create] do
      resource :likes, only: [:new, :create]
      resource :coments, only: [:new, :create]
    end
  end

end
