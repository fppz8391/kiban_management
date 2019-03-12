Rails.application.routes.draw do
    get 'kibans/index'

    post 'kibans/index'

    root to: 'kibans#index'

    post 'kibans/:id' => "kibans#check"

    get 'maker_deadlines/maker_deadline'

    resources :kibans
    resources :maker_deadlines
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
