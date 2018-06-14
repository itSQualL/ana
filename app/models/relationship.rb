class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  validates :followed, uniqueness: { scope: :follower}

  validate :autofollow
  validate :allow_block_user

  def destroy
    if is_block?
      errors.add(:is_block, "can't destroy block relationships")
      false
    else
      super
    end
  end

  private

  def autofollow
    if follower_id.equal?(followed_id)
      errors.add(:followed_id, "can't follow yourself")
    end
  end

  def allow_block_user
    if is_block? && allowed?
      errors.add(:allowed, "can't allow block users")
    end
  end
end
