Streetmom::Application.routes.draw do
  devise_for :users

  resources :reports do
    collection do
      get 'active'
      get 'history'
      get 'deleted'
      post 'filter'
    end

    member do
      put 'historify'
      post 'upload'
      get 'download' => 'reports#download', :as => :download
    end
  end

  resources :contacts

  resources :logs

  resources :responders, only: %w(index update) do
    collection do
      get 'by_phone'
    end
  end

  resources :dispatches, only: %w(create)
  resources :sms

  root 'pages#home'
end
