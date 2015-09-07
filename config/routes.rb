HearkenFinal::Application.routes.draw do
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  
  root to: "home#index"
end
