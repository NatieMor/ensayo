Rails.application.routes.draw do
  resources :calls
  resources :clients

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "clients#index"
#root "devise/shared/links"
#session_path
devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
 }


=begin
  unauthenticated do
    root :to => 'welcome#index'
  end

  authenticated do
    root :to => 'home#index'
  end
=end
end
