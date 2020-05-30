class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  # 入力後rails db:migrateコマンドを実行して、データベースを更新
end
