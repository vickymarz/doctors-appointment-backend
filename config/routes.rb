Rails.application.routes.draw do

scope :api, defaults: { format: 'json' } do
    devise_for :users, 
    controllers: { 
      registrations: 'users/registrations',
      sessions: 'users/sessions' }
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
