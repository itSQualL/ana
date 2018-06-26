class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  validates :followed, uniqueness: { scope: :follower}

  validate :autofollow
  validate :blocked?

  private

  def autofollow
    if follower_id.equal?(followed_id)
      errors.add(:followed_id, "can't follow yourself")
    end
  end

  def blocked?
    if followed_id.present?
      user = User.find(followed_id)

      if user.blocked_users.find_by(id: follower_id)
        errors.add(:followed_id, "can't follow this user")
      end
    end
  end
end
