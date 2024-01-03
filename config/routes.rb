Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :articles, only: %i[index show create destroy] do
    resources :messages, only: %i[create destroy] do
      member do
        patch :up
        patch :down #post with button_to
      end
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
