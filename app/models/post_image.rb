class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image # _idは含めません
  # PostCommentモデルとの関連付け
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # バリデーションチェック presence(存在)
  validates :shop_name, presence: true
  validates :image, presence: true
  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうか
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
