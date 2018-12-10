class Task < ApplicationRecord
  enum status: {"未着手": 0, "実行中": 1,  "完了": 2}
  enum priority: {"低": 0, "中": 10, "高": 20}
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 200 }
end
