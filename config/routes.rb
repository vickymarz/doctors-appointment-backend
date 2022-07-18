Rails.application.routes.draw do
  root "splash_screens#index"
  get 'splash_screens/index'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :doctors
      resources :users do
        resources :appointments
      end
    end
  end
end
