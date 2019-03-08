Rails.application.routes.draw do
    get 'kibans/index'

    post 'kibans/index'

    root to: 'kibans#index'

    post 'kibans/:id' => "kibans#index"

    post 'kibans/ajax_test'

    get 'maker_deadlines/maker_deadline'

    root to: 'maker_deadlines#index'

    resources :kibans
    resources :maker_deadlines
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
