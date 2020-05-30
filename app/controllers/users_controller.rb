class UsersController < ApplicationController
  def show
    # ユーザのデータを1件取得し、インスタンス変数へ渡す
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
    # ユーザ（@user）に関連付けられた投稿（.post_images）のみ、@post_imagesに渡すことができる
  end
  # プロフィール編集機能用のアクション
  def edit
    @user = User.find(params[:id])
  end
  # プロフィール編集を保存
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end