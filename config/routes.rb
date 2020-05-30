Rails.application.routes.draw do
  devise_for :users
  root 'post_images#index'
  # ルーティング設定、rails routesで確認
  resources :post_images, only: [:new,:create,:index,:show, :destroy] do
    # 投稿画像についてのいいねのルーティング
    resource :favorites, only: [:create, :destoroy]
    # 投稿画像についてのコメント機能のルーティング
    # この親子関係をネストするという
    resource :post_comments, only: [:create, :destroy]
    # →次にアクションを記述してコントローラに実装
  end
    # onlyを使って、不必要なルーティングが生成されるのを制限
    resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
