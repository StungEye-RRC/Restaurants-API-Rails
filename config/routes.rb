# frozen_string_literal: true

Rails.application.routes.draw do
  constraints ->(request) { request.format == :json } do
    resources :measured_ingredients
    resources :measurements
    resources :dishes
    resources :ingredients
    resources :restaurants
  end
end
