class PostComment < ApplicationRecord
  # UserモデルとPostCommentモデルを関連付ける
  belongs_to :user
  belongs_to :post_image
  # rails db:migrateを実行して、データベースを更新
end
