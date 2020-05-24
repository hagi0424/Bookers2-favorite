Rails.application.routes.draw do
  devise_for :installs
  devise_for :users
  root 'home#top'
  get 'home/about'
  resources :users,only: [:show,:index,:edit,:update]

  # bookにいいね機能を実装
  resources :books do
	  resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
	end
	# いいね機能をbookのルートを通して行うことで、book_idを取得
  # 単数形と複数形の違いに注意
  # 最初 resources :favorites としていたが、rootがfavoriteとfavoritesに分かれた
  # ゆえにbookのidがうまく取得できないなど、いいね機能がうまく働かなかった
  # 単数型にすることで、1:Nの関係により、bookに対して、一つのいいねが適用される

end
