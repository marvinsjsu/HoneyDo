Rails.application.routes.draw do

  #root to: "static_pages#root"

  resources :boards do
    resources :lists
  end


  namespace :api, defaults: { format: :json } do
    resources :boards do
      resources :lists, only: [:index, :show, :create, :update, :destroy]
    end

    resources :lists, only: [:index, :show, :create, :update, :destroy] do
      resources :cards, only: [:create, :update, :destroy]
    end

    resources :cards, only: [:index, :show, :create, :update, :destroy] do
       resources :items, only: [:create, :update, :destroy]
    end

    resources :items, only: [:index, :show, :create, :update, :destroy]
  end
end
