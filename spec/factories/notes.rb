FactoryBot.define do
  factory :note do
    user { create(:user) }
    body "lorem ipsum"
    shared false
  end
end
