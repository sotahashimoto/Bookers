class Book < ApplicationRecord
  # エラーメッセージ表示の際に必要
  # titleカラム、contentカラムは空白では登録できない
  validates :title, presence: true
  validates :body, presence: true
end
