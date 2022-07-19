Rails.application.routes.draw do

  namespace :v1 do 
    get 'doctors/index'
    get 'appointments/index'
    delete 'appointments/:id', to: "appointments#destroy"
    post 'appointments', to: "appointments#create"
    get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
