# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teams
  resources :members
  resources :projects
end
