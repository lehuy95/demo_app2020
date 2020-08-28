class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  scope :order_by_time, -> {order(created_at: :desc)}

  validates :content, presence: true, length: {maximum: 200}
  validates :user_id, presence: true
  validates :micropost_id, presence: true
end
