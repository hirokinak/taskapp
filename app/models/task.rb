class Task < ApplicationRecord
  enum status: {"draft": 0, "doing": 1,  "done": 2}
  enum priority: {"low": 0, "middle": 10, "high": 20}
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 200 }
  paginates_per 10

  belongs_to :user
end
