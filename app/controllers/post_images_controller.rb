class PostImagesController < ApplicationController
  # 画像投稿の画面を表示するアクションメソッド
  def new
    @post_image = PostImage.new
  end
  
  #  投稿データの保存
  # バリデーションチェックあり(空欄防止)
  # render :アクション名で、同じコントローラ内の別アクションのViewを表示
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end
  # ①controllerの処理でredirect_toを実行
  # ②redirect_toの引数で指定したURLにHTTPリクエストを実行
  # ③HTTPリクエストされたURLに対応するルーティング処理を実行
  # ④ルーティング処理に対応したcontroller、アクションが呼び出され処理を実行
  # ⑤処理に応じたviewのレンダリングを実行
  
  # トップページ。投稿データが表示するタイムライン
  # pageメソッドは、ページングのためのkaminariをインストールしたことで使用可能になったメソッド
  def index
    @post_images = PostImage.page(params[:page]).reverse_order
  end
  
  # 詳細画面を表示
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  # 削除機能をコントローラに実装
  def destroy
    # resourcesルーティングのdestroyで渡ってきたパラメータ（params[:id]）を元に、findメソッドを使って削除データを探し、@post_imageインスタンスに渡す
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    # indexページへの自動切り替え
    redirect_to post_image_path
  end

  # 投稿データのストロングパラメータ
  private
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
