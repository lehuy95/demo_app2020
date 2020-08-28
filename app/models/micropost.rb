class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  scope :order_by_time, -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
									message: "must be a valid image format" }

	# Returns a resized image for display.
	def display_image
		image.variant(resize_to_limit: [500, 500])
	end

  def feed_comment
    self.comments
  end
end
