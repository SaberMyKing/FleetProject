Rails.application.routes.draw do

  root 'home#index'

  post 'home/index'
  get  'home/index'

  get  'index', to: 'home#index'
  get  'fleets', to: 'fleets#index'

  get 'home/show'

  post 'home/login'

  get  'fleets/index'
  post  'fleets/index'

  get 'fleets/new'

  post 'fleets/create'

  post 'fleets/soft_destroy'

  get 'fleets/edit'

  post 'fleets/detail'

  patch 'fleets/update'


  get  'drivers', to: 'drivers#index'

  get 'home/show'

  post 'home/login'

  get  'drivers/index'
  post  'drivers/index'

  get 'drivers/new'

  post 'drivers/create'

  post 'drivers/soft_destroy'

  get 'drivers/edit'

  post 'drivers/detail'

  patch 'drivers/update'

end
