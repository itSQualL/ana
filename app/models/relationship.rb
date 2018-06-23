class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  validates :followed, uniqueness: { scope: :follower}

  validate :autofollow

  private

  def autofollow
    if follower_id.equal?(followed_id)
      errors.add(:followed_id, "can't follow yourself")
    end
  end
end
