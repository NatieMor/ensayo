Rails.application.routes.draw do
  resources :calls
  resources :clients
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "clients#index"
#root "devise/shared/links"
#session_path

=begin
  unauthenticated do
    root :to => 'welcome#index'
  end

  authenticated do
    root :to => 'home#index'
  end
=end
end
