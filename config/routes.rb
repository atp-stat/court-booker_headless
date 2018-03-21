Rails.application.routes.draw do
  root to: 'top#login'
  get 'top/login'

  # get 'main/index'
  get 'main/index', to: 'top#login'
  post 'main/index'
  get 'main/reserve/confirm', to: 'top#login'
  post 'main/reserve/confirm', to: 'main#reserve_confirm'
  get 'main/reserve', to: 'top#login'
  post 'main/reserve'

  get 'main/reserve/exec', to: 'main#reserve_exec'

  get 'reserve/start'
  get 'reserve/stop'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

end
