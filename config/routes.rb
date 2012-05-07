SimpleMetricsWebapp::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  namespace :api do
    resources :metrics
    resources :instruments
    resources :dashboards
  end

  match "api/graph" => "api/graph#show"

  # routes render the initial layout (client side rendering)
  match "metrics" => "home#index"
  match "metrics/:name" => "home#index", :constraints => { :name => /[^\/]+/ }
  match "instruments" => "home#index"
  match "instruments/:id" => "home#index"
  match "dashboards" => "home#index"
  match "dashboards/:id" => "home#index"
  match "about" => "home#index"

  root :to => 'home#index'
end
