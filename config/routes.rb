Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users, path: 'auth/users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup',
    password: 'password'
  },
controllers: {
sessions: 'users/sessions',
registrations: 'users/registrations',
confirmations: 'users/confirmations',
passwords: 'users/passwords'
}
end
