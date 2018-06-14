FactoryBot.define do
  factory :relationship do
    followed { create(:user) }
    follower { create(:user) }
  end
end
