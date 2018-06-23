class Block < ApplicationRecord
  belongs_to :blocker, class_name: 'User'
  belongs_to :blocked, class_name: 'User'

  validates :blocker_id, presence: true
  validates :blocked_id, presence: true

  validates :blocked, uniqueness: { scope: :blocker}

  validate :autoblock

  private

  def autoblock
    if blocker_id.equal?(blocked_id)
      errors.add(:blocked_id, "can't block yourself")
    end
  end
end
