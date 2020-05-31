class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Userモデルに、PostImageモデルとの関連付けを記述
  # 1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # プロフィール画像の設定機能
  attachment :profile_image
end
