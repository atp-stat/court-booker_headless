Rails.application.routes.draw do

  get 'top/login'

  # get 'main/index'
  get 'main/index', to: 'top#login'
  post 'main/index'
  get 'main/reserve/confirm', to: 'top#login'
  post 'main/reserve/confirm', to: 'main#reserve_confirm'
  get 'main/reserve', to: 'top#login'
  post 'main/reserve'
  get 'main/reserve/sucess', to: 'top#login'
  post 'main/reserve/sucess'
  get 'main/reserve/failure', to: 'top#login'
  post 'main/reserve/failure'

  get 'reserve/start'
  get 'reserve/stop'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
