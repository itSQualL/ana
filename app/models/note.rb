class Note < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :collection_note, optional: true

  has_many_attached :images

  validates :body, presence: true

  validate :user_or_collection_note_presence

  private

  def user_or_collection_note_presence
    if user_id.nil? && collection_note.nil?
      errors.add(:user_id, "can't be nil")
    end
  end
end
