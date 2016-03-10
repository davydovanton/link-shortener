resources :links, only: %i[index destroy]

get '/', to: 'dashboard#index', as: :root
