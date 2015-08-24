Rails.application.routes.draw do


  resources(:articles) do
    resources :comments, only: [:create, :destroy]
  end

  resources(:subscribers, only: [:create, :destroy])


  root 'articles#index'

end
