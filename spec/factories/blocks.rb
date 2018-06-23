FactoryBot.define do
  factory :block do
    blocked { create(:user) }
    blocker { create(:user) }
  end
end
