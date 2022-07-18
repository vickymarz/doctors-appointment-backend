Rails.application.routes.draw do

scope :api, defaults: { format: 'json' } do
    devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
end
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :doctors
      resources :users do
        resources :appointments
      end
    end
  end
end
