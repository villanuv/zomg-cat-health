class AuthConstraint
  def matches?(request)
    request.session['user_id'].present?
  end
end

HearkenFinal::Application.routes.draw do
  constraints(AuthConstraint.new) do
    resources :cats
  end

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  
  root to: "home#index"

  get "*any", to: redirect('/404')
end
