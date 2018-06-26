FactoryBot.define do
  factory :collection_note do
    user { create(:user) }
    shared false

    before(:create) do |collection_note, evaluator|
      build_list(:note, 1, collection_note: collection_note, user: nil)
    end
  end
end
