Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root "static_content/landing_pages#index"
  resources :products

  namespace :super do
    resources :dashboard, only: [:index]
  end

  namespace :client do
    resources :dashboard, only: [:index] do
      member do
        get :check_js
      end
    end
    resources :user_locations
    resources :tasks do
      resources :submissions, only: [:index, :destroy]
      resources :insights, only:[:index]
      get :export_data
    end
    # changed from users to app_users
    resources :app_users, only:[] do
      patch :activate
      patch :deactivate
    end

    # I am not sure about this controller
    resources :reporting, only:[:index] do
      get :task_report
    end
    resources :messages, only: [:index, :create]
    resources :groups do
      collection {post :update_members}
      get :manage
      get :get_data #what is this for? Not sure
    end

    resources :templates, only: [:index] do
      resources :templates_content, only: [:index, :show, :new, :create]
    end

    resources :filters, only: [:index] do
      collection{post :submit_filter}
    end

    resources :users

  end

  namespace :static_content do
    resources :landing_pages, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :tasks, only: [:create, :index]  do
      end
      resources :register
    end
  end



end
