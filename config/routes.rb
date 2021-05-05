Rails.application.routes.draw do
  resources :tickets do
    # collection
    get 'new_arrival', on: :collection
    get 'trend', on: :collection
    get 'near', on: :collection
    get 'on_sale', on: :collection

    # member
    member do
      post 'purchase'
    end
  end

  get '/login', to: 'users/sessions#new'
  delete 'logout', to: 'users/sessions#destroy'
  get 'sign_up', to: 'users/registrations#new'

  resources :posts, shallow: true do
    resources :comments
  end

  resources :users do
    resource :address
  end

end
