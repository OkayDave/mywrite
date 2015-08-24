Rails.application.routes.draw do


  resources(:articles) do
    resources :comments, only: [:create, :destroy]
  end

  resources(:subscribers, only: [:create]) do
    get "/unsubscribe/:token", action: :destroy, on: :collection # typically a DELETE or POST request, but when going from email clients it's best to roll with GET
    
  end


  root 'articles#index'

end
