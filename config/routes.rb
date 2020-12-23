Rails.application.routes.draw do
  scope '/api' do
    resources :todos
    resources :users
    resources :help_requests  
    resources :conversations, only: [:index, :create, :show, :update]
    resources :messages, only: [:create, :index, :show]
    resources :pictures, only: [:create, :index, :show, :upadate]
    mount ActionCable.server => '/cable'
  end
  post '/api/login', to: "session#login"
  post '/api/signup', to: "users#create"
  get '/api/auto-login', to: "session#auto_login"    

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
