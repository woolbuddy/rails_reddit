Rails.application.routes.draw do
  # root route
      # controller#actions
  root 'subs#index'

  # resource
    # resources :controller
    resources :subs do
      resources :topics
    end

    # , except: [:index, :show]
    # , only: [:index, :show]

  # custom routes
    # http verb 'controller/action', as: bananas, :to
    # get '/edit', to: 'subs#edit'
    # get '/show', to: 'subs#show'
    # delete '/subs/:id', to: 'subs#destroy'

    # /subs/1/topics/1
    # /subs/:subs_id/topics/:id

end