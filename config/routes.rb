# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes, only: [:index, :show, :create, :destroy] do
    resources :recipe_foods, except: :update
  end

  resources :foods, only: [:index, :show, :create, :new, :destroy] 
  resources :shopping_lists, only: [:index]
end
