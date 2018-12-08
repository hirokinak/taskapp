class Task < ApplicationRecord
  enum status:[:draft, :doing, :done]
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 200 }
end
