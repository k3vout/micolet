Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing#index"
  post "subscribe", to: "landing#subscribe"

  resources :users, only: [] do
    post :subscribe, on: :collection
  end

  resources :questions, only: [:show] do
    post :add_answer, on: :member
  end
end
