# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    root 'dashboard#index'
  end

  # Tip Calculator for users
  resources :tips, only: [:index, :create] do
    collection do
      post :calculate # Defines a route for `tips_calculate_path`
    end
  end

  # Set the root route to the tip calculator form
  root 'tips#index'
end
