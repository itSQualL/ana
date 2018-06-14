class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  validate :autofollow

  protected

  def autofollow
    if follower_id.equal?(followed_id)
      errors[:followed_id] << "can't autofollow you"
    end
  end
end
