Rails.application.routes.draw do
  root 'places#index'
  resources :places, only: [:index, :show]

  get 'filter_hoteles' => 'places#filter_hoteles'
  get 'filter_hostales' => 'places#filter_hostales'
  get 'filter_albergues' => 'places#filter_albergues'
  get 'filter_pensiones' => 'places#filter_pensiones'
  get 'filter_aparts' => 'places#filter_aparts'
  get 'filter_campings' => 'places#filter_campings'
  get 'ver_mapa' => 'places#mapa'
end
