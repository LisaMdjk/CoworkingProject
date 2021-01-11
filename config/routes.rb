Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :requests


  root 'home#index'
  get '/index-requestslist',  to: 'requestslist#indexlist', as: 'waitinglist'
  get '/profile',  to: 'home#fprofile', as: 'fprofile'
  get '/requests-details', to: 'requestslist#requestsdetails', as: 'requestsdetails'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
