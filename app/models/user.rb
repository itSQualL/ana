class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :relationships, foreign_key: "follower_id"
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"

  has_many :followees, through: :relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true

  def follow(other_user_id)
    relationships.create(followed_id: other_user_id)
  end

  def unfollow(other_user_id)
    relationships.find_by(followed_id: other_user_id).try(:destroy)
  end
end
