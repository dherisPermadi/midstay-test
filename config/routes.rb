# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: 'api' do
    namespace :v1 do
      resources :flats
      resources :neighborhoods
      resources :users do
        member do
          put :reset_password
        end
      end
    end
  end

  root to: 'home#index'
end
